import {
  Box,
  CardMedia,
  Chip,
  Skeleton,
  TextField,
  Typography,
} from "@mui/material";
import { SERVER_URL } from "../utils/URLs";

const ProjectInfo = (props) => {
  const { project } = props;

  return (
    <Box sx={{ width: "80%", mx: "10%" }}>
      <Box sx={{ mx: "30%", textAlign: "center" }}>
        <Chip
          sx={{ padding: 2 }}
          label={project.category.name}
          color="primary"
          variant="outlined"
        />
        <Chip
          sx={{ padding: 2, m: 2 }}
          label={"세부항목"}
          color="primary"
          variant="outlined"
        />
      </Box>

      <Box
        sx={{
          display: "flex",
          flexDirection: {
            sm: "column",
            md: "row",
          },
          justifyContent: "center",
          gap: 3,
          marginBottom: 5,
        }}
      >
        <Box>
          {project.images.length !== 0 ? (
            project.images
              .filter((image) => image.imageType.imageType === "product")
              .map((image) => (
                <CardMedia
                  key={image.fileName}
                  component={"img"}
                  sx={{ width: 450, height: 300, objectFit: "cover" }}
                  alt={image.fileName}
                  src={`${SERVER_URL}/admin/${image.url}`}
                />
              ))
          ) : (
            <Skeleton variant="rectangular" width={450} height={300} />
          )}
        </Box>
        <Box
          sx={{
            display: "flex",
            flexDirection: "column",
            gap: 2,
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
            <span>프로젝트 제목 :</span>
            <TextField size="small" value={project.title} sx={{ width: 350 }} />
          </Box>

          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              gap: 2,
              justifyContent: "end",
            }}
          >
            <span>프로젝트 설명 :</span>
            <TextField
              size="small"
              value={project.description}
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
            <span>목표 금액 :</span>
            <TextField
              size="small"
              value={`${project.targetFunding}원`}
              sx={{ width: 350 }}
            />
          </Box>

          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              gap: 1,
              justifyContent: "end",
            }}
          >
            <span>펀딩 일정 :</span>
            <Box
              sx={{
                display: "flex",
                alignItems: "center",
                gap: 1,
                justifyContent: "end",
                fontSize: 10,
              }}
            >
              <span>시작일</span>
              <TextField
                size="small"
                type="date"
                value={project.startDate}
                sx={{ width: 135 }}
              />
            </Box>
            <span>~</span>
            <Box
              sx={{
                display: "flex",
                alignItems: "center",
                gap: 1,
                justifyContent: "end",
                fontSize: 10,
              }}
            >
              <span>종료일</span>
              <TextField
                size="small"
                type="date"
                value={project.endDate}
                sx={{ width: 135 }}
              />
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
            <span>예상 전달일 :</span>
            <TextField
              size="small"
              value="펀딩 종료일로부터   30 일 후"
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
            <span>태그 :</span>
            {project.tags ? (
              <Box sx={{ display: "flex", flexWrap: "wrap", gap: 1 }}>
                {project.tags.map((tag, index) => (
                  <Chip
                    color="success"
                    key={index}
                    label={"#" + tag.name}
                    variant="outlined"
                  />
                ))}
              </Box>
            ) : (
              <div>태그가 없습니다</div>
            )}
          </Box>
        </Box>
      </Box>

      <Box sx={{ position: "relative", width: "100%" }}>
        <Box sx={{ backgroundColor: "#F9F9F9", width: "100%", height: 200 }}>
          <Box sx={{ padding: 6 }}>
            <Typography variant="body1">{project.descriptionDetail}</Typography>
          </Box>
        </Box>
        <Box
          sx={{
            position: "absolute",
            top: 10,
            left: 10,
            color: "black",
            backgroundColor: "rgba(255, 255, 255, 0.8)",
            padding: "5px 10px",
            borderRadius: "5px",
            fontWeight: "bold",
          }}
        >
          상세 설명
        </Box>
        <Box>
          {project.images.length !== 0 &&
            project.images
              .filter((image) => image.imageType.imageType === "description")
              .map((image) => (
                <CardMedia
                  key={image.ord}
                  component={"img"}
                  sx={{
                    margin: "auto",
                    my: 5,
                    width: "90%",
                    objectFit: "cover",
                  }}
                  alt={image.url}
                  src={`${SERVER_URL}/admin/${image.url}`}
                />
              ))}
        </Box>
      </Box>
    </Box>
  );
};

export default ProjectInfo;
