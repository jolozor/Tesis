<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Recepcion.aspx.cs" Inherits="Tesis.Pages.Recepcion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Recepcion
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <form runat="server">
        <br />
        <div class="mx-auto" style="width: 1000px">
            <h2>Recepción</h2>

            <div class="row g-3 small">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control md-3" ID="codrecepcion" runat="server" placeholder="Codigo de recepción" ReadOnly="True"></asp:TextBox>
                        <label for="codrecepcion">Codigo de recepción</label>
                    </div>
                </div>
                <div class="col-md">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modalbusqueda" onclick="">Busqueda</button>
                    <asp:Button CssClass="btn btn-success form-control-sm" ID="btnnuevo1" runat="server" Text="Nuevo" OnClick="btnnuevo1_Click" />
                </div>
                <div class="col-md">
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
            </div>


            <div class="row g-3">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="txtcodcliente" runat="server" placeholder="Codigo de cliente" ReadOnly="True"></asp:TextBox>
                        <label for="txtcodcliente">Codigo de cliente</label>
                    </div>
                </div>
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="txtdoccliente" runat="server" placeholder="Documento de Identidad" Enabled="true" CssClass="form-control"></asp:TextBox>
                        <label for="txtdoccliente">Documento de Identidad</label>
                    </div>
                </div>
                <div class="col-md">
                    <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="btnbuscar2" runat="server" Text="" ImageUrl="/Iconos/Lupa.png" OnClick="btnbuscar2_Click" />
                </div>

            </div>

            <div class="row g-2">
                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="Inputnombre" runat="server" placeholder="Nombre y Apellido" Onfocus="GetClientes" ReadOnly="True"></asp:TextBox>
                        <label for="Inputnombre">Nombre y Apellido</label>
                    </div>
                </div>

                <div class="col-md">
                    <div class="form-floating mb-3">
                        <asp:TextBox type="text" class="form-control" ID="txtruc" runat="server" placeholder="RUC" ReadOnly="True"></asp:TextBox>
                        <label for="txtruc">RUC</label>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md">
                    <div class="form-control form-control-sm">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <ajaxToolkit:ComboBox CssClass="form-floating" ID="ComboBox1" runat="server" placeholder="Marca" BorderStyle="None"></ajaxToolkit:ComboBox>

                        <button type="button" class="btn-primary small" data-bs-toggle="modal" data-bs-target="#exampleModalmarca" onclick="">
                            Nueva Marca</button>

                    </div>
                </div>

                <div class="col-md">
                    <div class="form-control form-control-sm">
                        <ajaxToolkit:ComboBox CssClass="form-floating" ID="ComboBox2" runat="server" placeholder="Tipo de Equipo" BorderStyle="None"></ajaxToolkit:ComboBox>

                        <button type="button" class="btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModaltipo" onclick="">
                            Nuevo Tipo
                        </button>

                    </div>
                </div>

                <div class="col-md">

                    <div class="form-floating">
                        <asp:TextBox class="form-control" placeholder="Detalles de Recepción" ID="txtdetallesr" runat="server" TextMode="MultiLine"></asp:TextBox>

                        <label for="txtdetallesr">Detalles de Recepción</label>
                    </div>
                </div>
                <div class="col-md">
                    <button type="button" id="agregarRegistro" class="btn-primary btn-sm" onclick="agregarRegistro_click">
                        Agregar
                    </button>
                </div>
                
            </div>

            <div class="col-md">
                <table id="tabla-registro">
                    <thead>
                        <tr>
                            <th>Marca</th>
                            <th>Tipo de equipo</th>
                            <th>Detalles</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

            <br />

            <div class="col-md">
                <div class="col-md gap-2 col-5 mx-auto" style="width: 450px">
                    <asp:Button CssClass="btn btn-success form-control-sm" ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                    <asp:Button CssClass="btn btn-primary form-control-sm" ID="btnModificar" runat="server" Text="Modificar" />
                    <asp:Button CssClass="btn btn-secondary form-control-sm" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    <asp:Button CssClass="btn btn-danger form-control-sm" ID="btnsalir" runat="server" Text="Salir" OnClick="btnsalir_Click" />

                </div>
            </div>

        </div>



        <!-- Modal Marca -->
        <div class="modal fade" id="exampleModalmarca" tabindex="-1" aria-labelledby="exampleModalMarca" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabelmarca">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <div class="mx-auto" style="width: 400px">
                            <h2>Registro de Marcas</h2>
                            <div class="col-md">
                                <div class="form-floating mb-3">
                                    <asp:TextBox type="text" class="form-control" name="inputmarca" ID="inputmarca" runat="server" placeholder="Marca"></asp:TextBox>
                                    <label for="inputmarca">Marca</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:ImageButton type="button" CssClass="btn btn-success form-control-sm" ID="ImageButton2" runat="server" Text="" ImageUrl="/Iconos/Agregar.png" OnClick="ImageButton2_Click" />
                        <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="Button2" runat="server" Text="" ImageUrl="/Iconos/Limpiar.png" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Tipo -->
        <div class="modal fade" id="exampleModaltipo" tabindex="-1" aria-labelledby="exampleModalTipo" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabeltipo">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <div class="mx-auto" style="width: 400px">
                            <h2>Registro de Tipo de Equipos</h2>
                            <div class="col-md">
                                <div class="form-floating mb-3">
                                    <asp:TextBox type="text" class="form-control" name="inputtipoequipo" ID="inputtipoequipo" runat="server" placeholder="Tipo de Equipo"></asp:TextBox>
                                    <label for="inputtipoequipo">Tipo de Equipo</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:ImageButton type="button" CssClass="btn btn-success form-control-sm" ID="ImageButton3" runat="server" Text="" ImageUrl="/Iconos/Agregar.png" OnClick="ImageButton3_Click" />
                        <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="ImageButton4" runat="server" Text="" ImageUrl="/Iconos/Limpiar.png" />
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal Busqueda de recepcion -->
        <div class="modal fade bd-example-modal-xl" id="Modalbusqueda" tabindex="-1" aria-labelledby="exampleModalBusqueda" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="ModalLabelbusqueda">Recepcion</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-2">
                            <div class="col-md">
                                <asp:TextBox type="text" class="form-control-sm" name="lbl" ID="Busquedainteractiva" runat="server" placeholder="Buscador"></asp:TextBox>

                                <asp:Button ID="Btnbusquedaibteractiva" runat="server" Text="Buscar" />
                            </div>
                        </div>

                        <br />

                        <asp:GridView runat="server" ID="gvrecepcion" class="table-sm table-borderless table-hover" AutoGenerateSelectButton="True"
                            RowStyle-BorderWidth="1" OnRowDataBound="OnRowDataBound" EditRowStyle-Width="100%" OnRowCommand="OnRowCommand">
                        </asp:GridView>
                    </div>
                    <div class="modal-footer">
                        <asp:ImageButton type="button" CssClass="btn btn-success form-control-sm" ID="ImageButton1" runat="server" Text="" ImageUrl="/Iconos/Agregar.png" OnClick="ImageButton2_Click" />
                        <asp:ImageButton type="button" CssClass="btn btn-secondary form-control-sm" ID="ImageButton5" runat="server" Text="" ImageUrl="/Iconos/Limpiar.png" />
                    </div>
                </div>
            </div>

        </div>

    </form>



</asp:Content>
