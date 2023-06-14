<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="Tesis.Pages.Empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <script type = "text/javascript" >

    function getOption()
        {
        selectElement = document.querySelector('#DropDownList1');
            output = selectElement.options[selectElement.selectedIndex].value;
            document.querySelector('.output').textContent = output;
        }
    </script>

     <form runat="server">
        <br />
        <div class="mx-auto" style="width:1000px">
            <h2>Registro de Empleados</h2>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="txtdocumento" runat="server" placeholder="Documento"></asp:TextBox>
                        <label for="txtdocumento">Documento de Identidad</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="txtnombre" runat="server" placeholder="Nombre y Apellido"></asp:TextBox>
                        <label for="txtnombre">Nombre y Apellido</label>
                    </div>
                </div>
            </div>
         
            <div class="form-floating mb-3">
                <asp:TextBox type="text" class="form-control" ID="txtdireccion" runat="server" placeholder="Dirección"></asp:TextBox>
                <label for="txtdireccion">Dirección</label>
            </div>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="txtcorreo" runat="server" placeholder="Correo Electronico"></asp:TextBox>
                        <label for="txtcorreo">Correo Electronico</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="txtcelular" runat="server" placeholder="Celular"></asp:TextBox>
                        <label for="txtcelular">Celular</label>
                    </div>
                </div>
            </div>


           <div class="col-md">
               <div class="form-floating mb-3">
                   <asp:ScriptManager id="ScriptManager1" runat="server" > </asp:ScriptManager>
                   <ajaxToolkit:ComboBox ID="ComboBox1"  runat="server" placeholder="Cargo" ></ajaxToolkit:ComboBox>
               </div>
           </div>



            <div class="col-md gap-2 col-5 mx-auto" style="width:450px"> 
                <asp:ImageButton type="button" CssClass="btn btn-success form-control-sm" ID="Button1" runat="server" Text="" ImageUrl="/Iconos/Agregar.png" OnClick="Button1_Click" />
            <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="Button2" runat="server" Text="" ImageUrl="/Iconos/Limpiar.png" />
                
            </div>

            <br />

            <div class="container row">
            <div class="table small">
                <asp:GridView runat="server" id="gvempleados" class="table-sm table-borderless table-hover" HorizontalAlign="Center">
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
