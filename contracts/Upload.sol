// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <1.0.0;

contract Upload{
    // to share access of a file to a user
    struct Access{
        // info of user to whom file is to be shared
        address user; 
        bool access;
    }
    mapping(address=>string[]) value;
    mapping(address=>mapping(address=>bool)) ownership;
    mapping(address=>Access[]) accessList;
    mapping(address=>mapping(address=>bool)) previousData;

    function addFile(address _user,string memory url)external {
        value[_user].push(url);
    }
    function giveAccess(address user) external {
        require(user != msg.sender, "You cannot give access to yourself.");
        ownership[msg.sender][user]=true;
        // if user is already in the list but they does not have access
        // so we need to check that through previousData
        if(previousData[msg.sender][user]){
            for (uint i=0; i<accessList[msg.sender].length; i++) 
            {
                if(accessList[msg.sender][i].user==user){
                    accessList[msg.sender][i].access=true;
                }
            }
        }
        else{
            accessList[msg.sender].push(Access(user,true));
            previousData[msg.sender][user]=true;//update previousData as it can be used again somewhere
        }
    }
    // this is why the ownership nested mapping is used 
    function removeAccess(address user)public {
        ownership[msg.sender][user]=false;
        for (uint i=0; i<accessList[msg.sender].length; i++) 
        {
            if(accessList[msg.sender][i].user==user){
                accessList[msg.sender][i].access=false;
            }
        }
    }
    
    function showFiles(address _user)external view returns(string[] memory) {
        require(_user==msg.sender || ownership[_user][msg.sender],"You don't have access");
        return value[_user];
    }

    function showAccessList()public view returns(Access[] memory){
        return accessList[msg.sender];
    }
}
