import {
  Paper,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Table,
  TableBody,
} from "@mui/material";
import React from "react";
import { RowItemCampania } from "../modules/campania/components";

export const CustomTableCampanias = ({
  headerData,
  rowData,
  onDeleteCampania,
}) => {
  const campaniasRow = rowData.map((item) => (
    <RowItemCampania
      key={item.id}
      item={item}
      onShowDeleteDialog={onShowDeleteDialog}
    />
  ));

  const campaniasHeader = headerData.map((item, index) => (
    <TableCell key={index + 1} width={item.width}>
      <b>{item.name}</b>
    </TableCell>
  ));

  return (
    <Paper sx={{ borderRadius: "0px" }}>
      <TableContainer
        sx={{ minWidth: 700 }}
        arial-aria-labelledby="customized table"
      >
        <Table>
          <TableHead>
            <TableRow
              sx={{
                "& th": {
                  color: "rgba(200,200,200)",
                  backgroundColor: "#404040",
                },
              }}
            >
              {campaniasHeader}
            </TableRow>
          </TableHead>
          <TableBody>{campaniasRow}</TableBody>
        </Table>
      </TableContainer>
    </Paper>
  );
};
