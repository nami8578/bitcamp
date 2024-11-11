import { Button, Typography, Box } from "@mui/material";

const GiftItem = (props) => {
  const { reward, index, handleClick } = props;

  return (
    <Button
      variant="contained"
      sx={{
        display: "flex",
        flexDirection: "column",
        margin: 2,
        width: 130,
        height: 100,
        backgroundColor: "#d6e6f5",
        color: "#5882FA",
        textAlign: "center",
        borderRadius: 5,
      }}
      onClick={() => handleClick(index)}
    >
      <Typography sx={{ padding: 0 }} variant="p">
        {reward.name}
      </Typography>
      <Box
        sx={{
          marginTop: 1,
          backgroundColor: "#FEFEFE",
          padding: "2px 4px",
          borderRadius: 2,
          color: "#000000",
        }}
      >{`수량 : ${reward.count} 개`}</Box>
    </Button>
  );
};

export default GiftItem;
