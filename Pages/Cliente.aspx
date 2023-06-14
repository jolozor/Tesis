<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="Tesis.Pages.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Cliente
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <form runat="server" autocomplete="off">
        <br />
        <div class="mx-auto" style="width:1000px">
            <h2>Registro de Clientes</h2>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" name="inputdocumento" ID="inputdocumento" runat="server" placeholder="Documento"></asp:TextBox>
                        <label for="inputdocumento">Documento de Identidad</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" name="inputruc" ID="inputruc" runat="server" placeholder="RUC"></asp:TextBox>
                        <label for="inputruc">RUC</label>
                    </div>
                </div>
            </div>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" name="inputnombre" ID="inputnombre" runat="server" placeholder="Nombre y apellido"></asp:TextBox>
                        <label for="inputnombre">Nombre y Apellido</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" name="inputdenominacion" ID="inputdenominacion" runat="server" placeholder="Denominacion"></asp:TextBox>
                        <label for="inputdenominacion">Denominación</label>
                    </div>
                </div>
            </div>
         

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-4">
                        <asp:TextBox type="text" class="form-control" name="inputdireccion" ID="inputdireccion" runat="server" placeholder="Direccion"></asp:TextBox>
                        <label for="inputdireccion">Direccion</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-2">
                        <asp:TextBox type="text" class="form-control" name="inputcelular" ID="inputcelular" runat="server" placeholder="Celular"></asp:TextBox>
                        <label for="inputcelular">Celular</label>
                    </div>
                </div>
            </div>

            <div class="col-md gap-2 col-5 mx-auto" style="width:450px"> 
                <asp:ImageButton type="button" CssClass="btn btn-success form-control-sm" ID="Button1" runat="server" Text="" ImageUrl="/Iconos/Agregar.png" OnClick="Button1_Click" />
            <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="Button2" runat="server" Text="" ImageUrl="/Iconos/Limpiar.png" />
            </div>
            
            <br />

            <div class="container row">
            <div class="table small">
                <asp:GridView runat="server" id="gvclientes" class="table-sm table-borderless table-hover" HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField HeaderText="Opciones">
                            <ItemTemplate>
                                <asp:ImageButton CssClass="btn btn-primary form-control-sm" ID="btnModificar" runat="server" Text="" ImageUrl="/Iconos/Editar.png" OnClick="btnModificar_Click" />
                                <asp:ImageButton CssClass="btn btn-danger form-control-sm" ID="btnEliminar" runat="server" Text="" ImageUrl="/Iconos/Anular.png" OnClick="btnEliminar_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        </div>
    </form>

</asp:Content>
