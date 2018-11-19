pragma solidity ^0.4.23;

contract Biss {

    struct Firmware {
        string key;
        string hash;
    }

    mapping (uint => Firmware) firmwares; // fileid => Firmware

    function saveKey(uint _fileID, string _key) public { // fileID의 펌웨어에 key를 저장
        firmwares[_fileID].key = _key;
    }

    function saveHash(uint _fileID, string _hash) public { // fileID의 펌웨어에 hash(펌웨어 해시)를 저장
        firmwares[_fileID].hash = _hash;
    }

    function loadKey(uint _fileID) public view returns (string _key) { // fileID로 해당 펌웨어의 key를 로드
        _key = firmwares[_fileID].key;
    }

    function verifyHash(uint _fileID, string _hash) public view returns (bool) { // 해당 fileID의 해시가 _hash인지 확인
        return (keccak256(abi.encodePacked(firmwares[_fileID].hash)) == keccak256(abi.encodePacked(_hash)));
    }

}
