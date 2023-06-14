<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="Tesis.Pages.Informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Informes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    
    <form runat="server" class="mb-3">
        <br />
        <div class="mx-auto" style="width:1000px">
            <h2>Informes</h2>
            <br />
            <div class="container" >
                <div class="row">
                    <div class="col" >
                        <div class="col-md">
                            <div class="form-check form-check-inline" >
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CellPadding="2" CellSpacing="2" Width="561px">
                                    <asp:ListItem Text="Recepcion" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Marca" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Clientes" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Tipo de Equipo" Value="4"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <br />

                        <div class="col-md">
                            <div class="col-md">
                                <asp:DropDownList  class="form-select mb-3" aria-label="Default select example" ID="DDinformes" runat="server"></asp:DropDownList>
                            </div>
                            
                            <div class="col-md">
                                <asp:TextBox type="text" class="form-control" ID="txtinformes" runat="server" placeholder=""></asp:TextBox>
                                <label for="txtinformes"></label>
                            </div>
                        </div>

                        <div class="row g-2">
                            <div class="col-md">
                                <div class="form-floating mb-3">
                                    <input type="date" class="form-control" id="floatingInputGrid1" placeholder="" >
                                    <label for="floatingInputGrid1">Desde fecha</label>
                                </div>
                            </div>

                            <div class="col-md">
                                <div class="form-floating mb-3">
                                    <input type="date" class="form-control" id="floatingInputGrid2" placeholder="">
                                    <label for="floatingInputGrid2">Hasta fecha</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md gap-2 col-5 mx-auto" style="width:250px">
                            <button type="button" class="btn btn-outline-success">Generar</button>
                            <button type="button" class="btn btn-outline-secondary">Cancelar</button>
                        </div>
                    
                    </div>
                    <%--<div class="col">
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action">Recepción por fecha</a>
                            <a href="#" class="list-group-item list-group-item-action">Recepción por clientes</a>
                            <a href="#" class="list-group-item list-group-item-action">Estado de Servicio</a>
                            <a href="#" class="list-group-item list-group-item-action">Recepción por marca</a>
                            <a href="#" class="list-group-item list-group-item-action">Recepción por tipo de equipo</a>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </form>

</asp:Content>
