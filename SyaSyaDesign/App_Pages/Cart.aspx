﻿<%@ Page Title="Cart" Language="C#" MasterPageFile="~/SyasyaDesign.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SyaSyaDesign.App_Pages.Cart" %>

<asp:Content ID="styleContent" ContentPlaceHolderID="head" runat="server">
    <title>Cart</title>
    <style>
        html {
            scroll-behavior: auto;
        }

        .checkoutbar {
            min-width: 415px;
            padding: 20px 40px;
            margin: 20px auto;
            font-size: 22px;
            font-weight: 800;
            position: sticky;
            top: 60px;
            z-index: 2;
        }

        .btn-checkout {
            background: transparent;
            font-size: 18px;
            color: white;
            padding: 5px 32px;
            border: white solid 1px;
        }

        .btn-plusminus {
            background: transparent;
            border: solid 1px;
            width: 42px;
            height: 36px;
        }

        .btn-delete {
            background: #ff8585;
            padding: 5px 15px;
            border: solid 1px;
            font-weight: 500;
            font-size: 10px;
            float: right
        }

        .quantity {
            border: solid 1px;
            padding: 5px 5px 0px 5px;
            margin: 0px 5px;
            text-align: center;
            width: 90px
        }

        .heading {
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 2rem;
            font-weight: 500;
            line-height: 1.5;
            text-align: center;
            padding: 3.5rem 0;
            color: #1a1a1a;
        }

        .btn-delete {
            border-radius: 6px;
            padding: 10px 16px;
            font-size: 18px;
        }

        .card-image {
            height: 250px;
            width: 180px;
            object-fit: cover;
        }

        #form1 {
            min-height: 600px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h1 class="heading" style="color: black"><b><span>Cart</span></b></h1>
    <div style="width: 50%; margin: auto;">
        <form runat="server" id="form1">
            <div class="container">
                <div class="row flex-column m-auto ">
                    <!--card group-->
                    <asp:Repeater ID="cartItemRepeater" runat="server" OnItemCommand="cartItemRepeater_ItemCommand">
                        <ItemTemplate>
                            <div class="card flex-row shadow" style="margin: 10px 0px; min-width: 415px">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("ProductName")%></h5>
                                    <div class="d-flex justify-content-start" style="margin: 10px 0; float: right">
                                        <!--decrease button-->
                                        <asp:Button CommandName="minus" CommandArgument='<%# Eval("ProductID")%>'
                                            Text="-" runat="server" ID="btnMinus" CssClass="btn-plusminus" />
                                        <!--quantity-->
                                        <asp:Label ID="lblQuantity" CssClass="card-text quantity" Text='<%# Eval("Quantity")%>' runat="server"></asp:Label>
                                        <!--increase button-->
                                        <asp:Button CommandName="plus" CommandArgument='<%# Eval("ProductID")%>'
                                            Text="+" runat="server" ID="btnPlus" CssClass="btn-plusminus" />
                                    </div>

                                    <br />
                                    Unit Price&nbsp;: RM &nbsp;
                                    <asp:Label ID="lblUnit" Text='<%# Eval("Price")%>' runat="server" />
                                    <br />
                                    Sub-total&nbsp;&nbsp;:  RM &nbsp;
                                    <asp:Label ID="lblSubtotal" Text='<%# Eval("TotalPrice")%>' runat="server" />
                                    <br />
                                    <asp:Button CommandName="delete" CommandArgument='<%# Eval("ProductID")%>'
                                        Text="Delete" runat="server" ID="btnDelete" CssClass="btn-delete text-light bg-danger" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="checkoutbar bg-dark text-light shadow d-flex justify-content-between">
                    <div>
                        Total: RM
                    <asp:Label ID="lblTotalPrice" runat="server"></asp:Label><br />
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </div>
                    <div>
                        <asp:Button ID="btnCheckout" CssClass="btn-checkout" runat="server" Text="Check Out" OnClick="btnCheckout_Click" />
                    </div>
                </div>

            </div>
        </form>
    </div>

</asp:Content>
