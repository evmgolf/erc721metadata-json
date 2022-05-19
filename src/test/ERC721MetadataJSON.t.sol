// SPDX-License-Identifier: BSD-3-Clause
pragma solidity 0.8.13;
import "forge-std/Test.sol";
import {ERC721MetadataJSON} from "../ERC721MetadataJSON.sol";

contract ERC721MetadataJSONTest is Test {
  function testOutputsSomething(bytes calldata name, bytes calldata description, bytes calldata image) public {
    assertGt(ERC721MetadataJSON.json(name, description, image).length, 0);
  }

  function testOutputsSomething(bytes calldata name, bytes calldata description, bytes calldata image, bytes[] calldata keys, bytes[] calldata values) public {
    if (keys.length > values.length) {
      vm.expectRevert(stdError.indexOOBError);
      ERC721MetadataJSON.json(name, description, image, keys, values);
    } else {
      assertGt(ERC721MetadataJSON.json(name, description, image, keys, values).length, 0);
    }
  }
}
