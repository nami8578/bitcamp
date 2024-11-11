import { Button, Typography } from "@mui/material";

const PackageItem = (props) => {
  const { pack, index, handleClick } = props;

  return (
    <Button
      variant="contained"
      sx={{
        margin: "auto",
        width: 350,
        height: 100,
        backgroundColor: "#d6e6f5",
        color: "#819FF7",
        textAlign: "center",
        borderRadius: 5,
      }}
      onClick={() => handleClick(index)}
    >
      <Typography sx={{ padding: 4 }} variant="h6">
        {pack.name}
      </Typography>
    </Button>
  );
};

export default PackageItem;
