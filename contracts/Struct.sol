// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Struct {
    struct Book { 
        string title;
        string author;
        uint book_id;
    }

    struct BioData {
        string name;
        string gender;
    }

    Book public book;
    BioData public userData;

    function createObj() external {
        book = Book("GOT", "Martin", 1);
    }

    function generateUserData() external {
        userData = BioData("Junaid", "male");
    }
}