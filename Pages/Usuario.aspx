<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="Tesis.Pages.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <form runat="server" class="mb-3">
        <br />
        <div class="mx-auto" style="width:500px">
            <h2>Registro de Usuarios</h2>
            <div class="col-md">
                <div class="form-floating mb-3">
                    <asp:TextBox type="text" class="form-control" ID="txtusuario" runat="server" placeholder="Usuario"></asp:TextBox>
                    <label for="txtnombre">Usuario</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox type="password" class="form-control" ID="txtpassword" runat="server" placeholder="Contraseña"></asp:TextBox>
                    <label for="txtnombre">Contraseña</label>
                </div>
            </div>
        </div>

        <div class="col-md gap-2 col-5 mx-auto" style="width:300px">
            <asp:ImageButton type="button" CssClass="btn btn-success form-control-sm" ID="Button1" runat="server" Text="" ImageUrl="/Iconos/Agregar.png" OnClick="Button1_Click" />
            <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="Button2" runat="server" Text="" ImageUrl="/Iconos/Limpiar.png" OnClick="Button2_Click" />
       </div>

        <br />


        <div class="container row">
            <div class="table small">
                <asp:GridView runat="server" id="gvusuarios" class="table-sm table-borderless table-hover" HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField HeaderText="Opciones">
                            <ItemTemplate>
                                <asp:ImageButton CssClass="btn btn-primary form-control-sm" ID="btnModificar" runat="server" Text="" ImageUrl="/Iconos/Editar.png" OnClick="btnModificar_Click"/>
                                <asp:ImageButton CssClass="btn btn-danger form-control-sm" ID="btnEliminar" runat="server" Text="" ImageUrl="/Iconos/Anular.png" OnClick="btnEliminar_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </form>

</asp:Content>
