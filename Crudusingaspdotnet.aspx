<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crudusingaspdotnet.aspx.cs" Inherits="Crudusingdotnet.Crudusingaspdotnet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="image.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }

        table {
        }

        .auto-style2 {
            width: 505px;
        }

        .auto-style3 {
            height: 26px;
            width: 505px;
        }
    </style>
</head>
<body id="bdyimg">
    <form id="form1" runat="server">
        <div align="center">
            <div style="border: 1px Solid #0094ff; width: 90%;">
                <table>
                    <tr>
                        <td colspan="3" align="center">
                            <h2>&nbsp; Employee Management System&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </h2>
                        </td>
                    </tr>

                    <tr>
                        <td>First Name
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox runat="server" ID="txtFirstName" ValidationGroup="add"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="reqFirstName" ControlToValidate="txtFirstName" ForeColor="Red" ErrorMessage="First Name Requierd" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox runat="server" ID="txtLastName" ValidationGroup="add"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="reqLastName" ControlToValidate="txtLastName" ForeColor="Red" ErrorMessage="Last Name Required" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Phone Number
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox runat="server" ID="txtPhoneNumber"></asp:TextBox>
                        </td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td>Email Address
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox runat="server" ID="txtEmailAddress" ValidationGroup="add"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="reqEmailAddress" ControlToValidate="txtEmailAddress" ForeColor="Red" ErrorMessage="Email Address Required" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Salary
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox runat="server" ID="txtSalary" ValidationGroup="add"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ID="reqSalary" ControlToValidate="txtSalary" ForeColor="Red" ErrorMessage="Salary Required" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button runat="server" ID="btnAddEmployee" Text="Add" OnClick="btnAddEmployee_Click" Style="height: 26px" Width="37px" ValidationGroup="add" />
                            <asp:Button runat="server" ID="btnAddEmployeereset" Text="Reset" OnClick="btnAddEmployeerest_Click" Style="height: 26px" Width="50px" ValidationGroup="add" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <br />
                            <asp:Label runat="server" ID="lblMessage"></asp:Label>
                            <br />
                            <br />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="grvEmployee" runat="server" AllowPaging="true" AutoGenerateColumns="false" Width="900px"
                                HeaderStyle-ForeColor="blue" OnPageIndexChanging="grvEmployee_PageIndexChanging"
                                OnRowCancelingEdit="grvEmployee_RowCancelingEdit"
                                OnRowDeleting="grvEmployee_RowDeleting"
                                OnRowEditing="grvEmployee_RowEditing"
                                OnRowUpdating="grvEmployee_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="EmpId">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblEmpId" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FirstName">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblFirstName" Text='<%#Eval("FirstName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtFirstName" Text='<%#Eval("FirstName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="LastName">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblLastName" Text='<%#Eval("LastName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtLastName" Text='<%#Eval("LastName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone No.">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblPhoneNumber" Text='<%#Eval("PhoneNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtPhoneNumber" Text='<%#Eval("PhoneNumber") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblEmailAddress" Text='<%#Eval("EmailAddress") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtEmailAddress" Text='<%#Eval("EmailAddress") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Salary">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblSalary" Text='<%#Eval("Salary") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtSalary" Text='<%#Eval("Salary") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Manage">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnEdit" Text="Edit" CommandName="Edit" />
                                            <br />
                                            <span onclick="return confirm('Are you sure you want to delete this record?')">
                                                <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" CommandName="Delete" />
                                            </span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnUpdate" Text="Update" CommandName="Update" />
                                            <br />
                                            <asp:LinkButton runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <a href="http://www.nextprogramming.com/2014/09/stored-procedure-in-sql-server-advantages-of-stored-procedure-and-how-to-use-stored-procedure">Click Here</a>
    </form>
</body>
</html>
