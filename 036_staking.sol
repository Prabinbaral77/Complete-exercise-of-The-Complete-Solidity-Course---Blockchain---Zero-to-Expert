// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./IERC20.sol";

contract Staking {
    IERC20 public immutable stakingToken;
    IERC20 public immutable rewardToken;

    address public owner;

    uint public duration;
    uint public finishedAt;
    uint public updatedAt;
    uint public rewardRate;
    uint public rewardPerTokenStored;
    mapping(address => uint) public userRewardPerTokenPaid;
    mapping(address => uint) public rewards;

    uint public totalSupply;
    mapping(address => uint) public balanceOf;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier updateReward(address _account) {
        rewardPerTokenStored = rewardPerToken();
        updatedAt = lastTimeRewardApplicable();

        if (_account != address(0)) {
            rewards[_account] = earned(_account);
            userRewardPerTokenPaid[_account] = rewardPerTokenStored;
        }
        _;
    }

    constructor(address _stakingToken, address _rewardToken) {
        owner = msg.sender;
        stakingToken = IERC20(_stakingToken);
        rewardToken = IERC20(_rewardToken);
    }

    function setRewardDuration(uint _duration) external onlyOwner {
        require(
            finishedAt < block.timestamp,
            "Reward duration is not finished"
        );
        duration = _duration;
    }

    function notifyRewardAmount(uint _amount)
        external
        onlyOwner
        updateReward(address(0))
    {
        if (finishedAt < block.timestamp) {
            rewardRate = _amount / duration;
        } else {
            uint remainningReward = rewardRate * (finishedAt - block.timestamp);
            rewardRate = (remainningReward + _amount) / duration;
        }
        require(rewardRate > 0, "Reward rate = 0");
        require(
            rewardRate * _amount <= rewardToken.balanceOf(address(this)),
            "rewardAmount > balance"
        );

        finishedAt = block.timestamp + duration;
        updatedAt = block.timestamp;
    }

    function stake(uint _amount) external updateReward(msg.sender) {
        require(_amount > 0, "Staking amount must not be zero");
        stakingToken.transferFrom(msg.sender, address(this), _amount);
        balanceOf[msg.sender] += _amount;
        totalSupply += _amount;
    }

    function withdraw(uint _amount) external updateReward(msg.sender) {
        require(_amount > 0, "Staking amount must not be zero");
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        stakingToken.transfer(msg.sender, _amount);
    }

    function lastTimeRewardApplicable() public view returns (uint) {
        return _min(block.timestamp, finishedAt);
    }

    function rewardPerToken() public view returns (uint) {
        if (totalSupply == 0) {
            return rewardPerTokenStored;
        } else {
            return
                rewardPerTokenStored +
                (rewardRate * (lastTimeRewardApplicable() - updatedAt) * 1e18) /
                totalSupply;
        }
    }

    function earned(address _account) public view returns (uint) {
        return
            (balanceOf[_account] *
                (rewardPerToken() - userRewardPerTokenPaid[_account])) /
            1e18 +
            rewards[_account];
    }

    function getReward() external updateReward(msg.sender) {
        uint reward = rewards[msg.sender];
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rewardToken.transfer(msg.sender, reward);
        }
    }

    function _min(uint x, uint y) private pure returns (uint) {
        return x >= y ? y : x;
    }
}
