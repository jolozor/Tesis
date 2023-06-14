<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Recepcion 2.aspx.cs" Inherits="Tesis.Pages.Recepcion_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form runat="server">
        <br />

        <div class="col-md">
            <asp:TextBox type="text" class="form-control-sm" name="lbl" ID="Busquedainteractiva2" runat="server" placeholder="Buscador" OnTextChanged="Busquedainteractiva2_TextChanged"></asp:TextBox>
            <asp:Button ID="Btnbusquedainteractiva2" runat="server" Text="Buscar"  />
            <asp:Button ID="BtnCancelarbusqueda" runat="server" Text="Cancelar" OnClick="BtnCancelarbusqueda_Click" />
        </div>


        <br />
        <div class="table-primary justify-content-center">
            <asp:GridView ID="gvrecepcion2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>


            


        <br />
        <div class="table-primary justify-content-center">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Table ID="Table1" runat="server" BorderColor="#3366FF" BorderStyle="Solid" BorderWidth="1" CssClass="ms-lg-3" Width="905px">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Tipo</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Marca</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Detalles</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow>
                    <asp:TableCell>
                        <ajaxToolkit:ComboBox CssClass="form-floating" ID="ComboBox2" runat="server" placeholder="Tipo de Equipo" BorderStyle="None"></ajaxToolkit:ComboBox>
                    </asp:TableCell>

                     <asp:TableCell>
                         <ajaxToolkit:ComboBox CssClass="form-floating" ID="ComboBox1" runat="server" placeholder="Marca" BorderStyle="None"></ajaxToolkit:ComboBox>
                     </asp:TableCell>

                     <asp:TableCell>
                         <asp:TextBox class="form-control" placeholder="Detalles de Recepción" ID="txtdetallesr" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox>
                     </asp:TableCell>
                </asp:TableHeaderRow>
            </asp:Table>
            
        </div>
        

    </form>
</asp:Content>
