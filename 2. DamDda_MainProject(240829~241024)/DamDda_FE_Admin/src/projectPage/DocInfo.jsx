import { Box, Button, Dialog, TextField, Typography } from "@mui/material";
import { useState } from "react";
import { SERVER_URL } from "../utils/URLs";
import apiClient from "../utils/ApiClient";
import DocItem from "./DocItem";
import { useAdmin } from "../utils/AdminContext";

const DocInfo = (props) => {
  const { adminId } = useAdmin();
  const { project, approval } = props;
  const [open, setOpen] = useState(false);
  const [text, setText] = useState("");

  const handleText = (e) => setText(e.target.value);

  const handleClose = () => setOpen(!open);

  const submit = async (updatedApproval) => {
    console.log({
      adminId: adminId,
      projectId: project.id,
      approval: updatedApproval,
      approvalText: updatedApproval === 1 ? "프로젝트가 승인되었습니다." : text,
    });
    apiClient({
      method: "PUT",
      url: `${SERVER_URL}/admin/projects/${project.id}`,
      headers: {
        "Content-Type": "application/json",
      },
      data: {
        adminId: adminId,
        projectId: project.id,
        approval: updatedApproval,
        approvalText:
          updatedApproval === 1 ? "프로젝트가 승인되었습니다." : text,
      },
    })
      .then((response) => response.data)
      .catch((e) => console.error(e));
    setText("");
    window.location.reload(true);
  };

  return (
    <Box sx={{ width: "80%", mx: "10%", my: 5 }}>
      <Typography>진행자 서류 제출</Typography>
      <Box
        sx={{
          display: "flex",
          flexDirection: "row",
          width: "100%",
          height: 170,
          backgroundColor: "#EEEEEE",
          marginBottom: 7,
        }}
      >
        {project.documents
          .filter((doc) => doc.fileName.startsWith("[진행자]"))
          .map((doc, index) => (
            <DocItem key={index} doc={doc} projectId={project.id} />
          ))}
      </Box>

      <Typography>인증 서류 제출</Typography>
      <Box
        sx={{
          display: "flex",
          flexDirection: "row",
          width: "100%",
          height: 170,
          backgroundColor: "#EEEEEE",
        }}
      >
        {" "}
        {project.documents
          .filter((doc) => doc.fileName.startsWith("[인증]"))
          .map((doc, index) => (
            <DocItem key={index} doc={doc} projectId={project.id} />
          ))}
      </Box>

      <Box sx={{ display: "flex", justifyContent: "end", m: 2 }}>
        <Button
          onClick={() => {
            if (window.confirm("해당 프로젝트 등록을 승인하시겠습니까?")) {
              submit(1);
            }
          }}
          sx={{ m: 1 }}
          variant="contained"
          color="primary"
          disabled={approval !== 0}
        >
          승인
        </Button>
        <Button
          onClick={handleClose}
          sx={{ m: 1 }}
          variant="contained"
          color="error"
          disabled={approval !== 0}
        >
          거절
        </Button>
        <Dialog open={open} onClose={handleClose}>
          <Box sx={{ display: "flex", padding: 2 }}>
            <Typography sx={{ m: 1 }} variant="h5">
              거절 사유
            </Typography>
            <Typography sx={{ fontSize: "13px", alignSelf: "flex-end" }}>
              거절 사유를 10자 이상 적어주세요.
            </Typography>
          </Box>
          <TextField
            sx={{ m: 2 }}
            multiline
            rows={4}
            value={text}
            onChange={handleText}
          />
          <Box sx={{ display: "flex", justifyContent: "center" }}>
            <Button
              onClick={() => {
                submit(2);
                handleClose();
              }}
              sx={{ m: 1 }}
              variant="contained"
              color="primary"
            >
              제출
            </Button>
            <Button
              onClick={() => {
                setText("");
                handleClose();
              }}
              sx={{ m: 1 }}
              variant="contained"
              color="danger"
            >
              취소
            </Button>
          </Box>
        </Dialog>
      </Box>
    </Box>
  );
};

export default DocInfo;
