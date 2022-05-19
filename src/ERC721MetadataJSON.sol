// SPDX-License-Identifier: BSD-3-Clause
pragma solidity 0.8.13;

import {DataURI} from "uri/Data.sol";

library ERC721MetadataJSON {
  using DataURI for bytes;

  function json(bytes memory name, bytes memory description, bytes memory image) internal pure returns (bytes memory) {
    return bytes.concat(
        "{\"name\":\"",
        name,
        "\",\"description\":\"",
        description,
        "\",\"image\":\"",
        image,
        "\"}"
    );
  }
  function json(bytes memory name, bytes memory description, bytes memory image, bytes[] memory keys, bytes[] memory values) internal pure returns (bytes memory text) {
    text = bytes.concat(
        "{\"name\":\"",
        name,
        "\",\"description\":\"",
        description,
        "\",\"image\":\"",
        image,
        "\",\"attributes\":["
    );

    if (keys.length > 0) {
      text = bytes.concat(text, "{\"trait_type\":\"", keys[0], "\",\"value\":", values[0], "}");
      for (uint i=1; i<keys.length; i++) {
        text = bytes.concat(text, ",{\"trait_type\":\"", keys[i], "\",\"value\":", values[i], "}");
      }
    }
    text = bytes.concat(text, "]}");
  }

  function uriBase64(bytes memory _text) internal pure returns (bytes memory) {
    return _text.dataURIBase64("application/json");
  }
}
