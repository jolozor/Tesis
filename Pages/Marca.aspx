<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Marca.aspx.cs" Inherits="Tesis.Pages.Marca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Marca
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <form runat="server" class="mb-3">
        <br />
        <div class="mx-auto" style="width:500px">
            <h2>Registro de Marcas</h2>
            <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" name="inputmarca" ID="inputmarca" runat="server" placeholder="Marca"></asp:TextBox>
                    <label for="inputmarca">Marca</label>
                    </div>
                </div>
        </div>

       <div class="col-md gap-2 col-5 mx-auto" style="width:300px">
            <asp:ImageButton type="button" CssClass="btn btn-success form-control-sm" ID="Button1" runat="server" Text="" ImageUrl="/Iconos/Agregar.png" OnClick="Button1_Click" />
            <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="Button2" runat="server" Text="" ImageUrl="/Iconos/Limpiar.png" />
       </div>

        <br />
        
        <div class="container row">
            <div class="table small">
                <asp:GridView runat="server" id="gvmarcas" class="table-sm table-borderless table-hover" HorizontalAlign="Center">
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

    </form>

</asp:Content>
