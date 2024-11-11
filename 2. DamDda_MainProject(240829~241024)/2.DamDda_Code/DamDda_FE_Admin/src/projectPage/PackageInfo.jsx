import { Box, Button, Chip, TextField, Typography } from "@mui/material";
import PackageItem from "./PackageItem";
import { useState } from "react";
import GiftItem from "./GiftItem";

const PackageInfo = (props) => {
  const { packages } = props;
  const [currentPackageIndex, setCurrentPackageIndex] = useState(0);
  const [currentGiftIndex, setCurrentGiftIndex] = useState(0);

  const handleClickPackage = (index) => {
    setCurrentGiftIndex(0);
    setCurrentPackageIndex(index);
  };

  const handleClickGift = (index) => {
    setCurrentGiftIndex(index);
  };

  return (
    <Box
      sx={{
        display: "flex",
        justifyContent: "center",
      }}
    >
      <Box
        sx={{ display: "flex", flexDirection: "row", gap: 2, marginBottom: 5 }}
      >
        <Box
          sx={{
            display: "flex",
            flexDirection: "column",
            justifyContent: "center",
            width: 500,
            height: 600,
            backgroundColor: "#EEEEEE",
          }}
        >
          {packages.map((pack, index) => (
            <PackageItem
              key={index}
              pack={pack}
              index={index}
              handleClick={handleClickPackage}
            />
          ))}
        </Box>
        <Box
          sx={{
            margin: 5,
            width: 500,
            display: "flex",
            flexDirection: "column",
            gap: 6,
          }}
        >
          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              gap: 2,
              justifyContent: "end",
            }}
          >
            <span>선물구성이름 :</span>
            <TextField
              value={packages[currentPackageIndex].name}
              size="small"
              sx={{ width: 350 }}
            />
          </Box>

          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              gap: 2,
              justifyContent: "end",
            }}
          >
            <span>1인당 수량제한 :</span>
            <Box
              size="small"
              sx={{
                width: 160,
                height: 30,
                borderRadius: 3,
                paddingTop: 1,
                backgroundColor: "#d6e6f5",
                textAlign: "center",
                color: "#819FF7",
              }}
            >
              {packages[currentPackageIndex].quantityLimited === 0
                ? "없음"
                : "있음"}
            </Box>
            <TextField
              size="small"
              sx={{ width: 165 }}
              value={
                packages[currentPackageIndex].quantityLimited !== 0
                  ? packages[currentPackageIndex].quantityLimited + " 개"
                  : ""
              }
            />
          </Box>
          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              gap: 2,
              justifyContent: "end",
            }}
          >
            <span>선물구성 금액 :</span>
            <TextField
              size="small"
              sx={{ width: 350 }}
              value={
                packages[currentPackageIndex].price
                  .toString()
                  .replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원"
              }
            />
          </Box>

          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              gap: 2,
              justifyContent: "end",
            }}
          >
            <span>선물 리스트 :</span>
            <Box
              sx={{
                display: "flex",
                width: 350,
                backgroundColor: "#EFEFEF",
                overflow: "auto",
                whiteSpace: "nowrap",
              }}
            >
              {packages[currentPackageIndex].RewardList.map((reward, index) => (
                <GiftItem
                  reward={reward}
                  index={index}
                  key={index}
                  handleClick={handleClickGift}
                />
              ))}
            </Box>
          </Box>

          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              gap: 2,
              justifyContent: "end",
            }}
          >
            <span>선물 옵션 리스트 :</span>
            <Box
              sx={{
                width: 350,
                backgroundColor: "#EFEFEF",
                overflow: "auto",
                whiteSpace: "nowrap",
              }}
            >
              {packages[currentPackageIndex].RewardList[
                currentGiftIndex
              ].OptionList.map((option, index) => (
                <Chip
                  sx={{ margin: "10px" }}
                  key={index}
                  color="primary"
                  label={option}
                />
              ))}
            </Box>
          </Box>
        </Box>
      </Box>
    </Box>
  );
};

export default PackageInfo;
