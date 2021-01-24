switch (groupID group player) do
{
	case "A1":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 0) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 0) select 1);
		};
	};

	case "A2":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 1) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 1) select 1);
		};
	};

	case "B1":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 2) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 2) select 1);
		};
	};

	case "B2":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 3) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 3) select 1);
		};
	};

	case "C1":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 4) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 4) select 1);
		};
	};

	case "C2":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 5) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 5) select 1);
		};
	};

	case "D1":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 6) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 6) select 1);
		};
	};

	case "D2":
	{
		_playerGroup = units group player;
		_memberIndexNumber = _playerGroup find player;
		_memberAssignedNumber = _memberIndexNumber + 1;

		_groupHalf = (count _playerGroup) / 2;

		if (_memberAssignedNumber <= _groupHalf) then
		{
			player assignTeam ((TCS_var_FTColors select 7) select 0);
		}
		else
		{
			player assignTeam ((TCS_var_FTColors select 7) select 1);
		};
	};
};