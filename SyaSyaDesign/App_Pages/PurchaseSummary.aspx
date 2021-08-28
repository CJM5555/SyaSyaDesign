﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SyasyaDesign.Master" AutoEventWireup="true" CodeBehind="PurchaseSummary.aspx.cs" Inherits="SyaSyaDesign.App_Pages.PurchaseSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin-top: 50px;
            margin-bottom: 50px
        }

        .card {
            position: relative;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 0.10rem
        }

        .card-header:first-child {
            border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
        }

        .card-header {
            padding: 0.75rem 1.25rem;
            margin-bottom: 0;
            background-color: #ffffff;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1)
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h1 class="heading" style="color: black"><b><span>Purchase Summary</span></b></h1>
    <form id="form1" runat="server">
        <div class="container">
            <article class="card">
                <header class="card-header">
                    <h6>Order ID:
                <asp:Label ID="lblOrderId" runat="server"></asp:Label>
                    </h6>
                </header>
                <div class="card-body">
                    <div style="margin-bottom: 50px;">
                        <article class="card">
                            <div class="card-body row">
                                <div class="col">
                                    <strong>Order time:<br />
                                    </strong>
                                    <asp:Label ID="lblOrderTime" runat="server"></asp:Label>
                                    <br>
                                </div>
                                <div class="col">
                                    <strong>Estimated Arrive time:<br />
                                    </strong>
                                    <asp:Label ID="lblEstimatedArriveTime" runat="server"></asp:Label>
                                </div>
                                <div class="col"><strong>Courier Services:</strong>
                                    <br>
                                    POS LAJU</div>
                                <div class="col">
                                    <strong>Delivery address:<br />
                                    </strong>
                                    <asp:Label ID="lblDeliveryAddress" runat="server"></asp:Label>
                                    <br>
                                </div>
                                <div class="col">
                                    <strong>Status:<br />
                                    </strong>
                                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                    <br>
                                    <strong>Tracking No:<br />
                                    </strong>
                                    <asp:Label ID="lblTrackNo" runat="server"></asp:Label>
                                </div>
                            </div>
                        </article>
                    </div>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <table class="table w-100 p3 ms-auto me-auto">
                                <thead>
                                    <tr>
                                        <th style="width: 10%; text-align: center" scope="col">No.</th>
                                        <th style="width: 10%; text-align: center" scope="col">Product ID</th>
                                        <th style="width: 20%; text-align: center" scope="col">Name</th>
                                        <th style="width: 15%; text-align: center" scope="col">Unit Price</th>
                                        <th style="width: 10%; text-align: center" scope="col">Quantity</th>
                                        <th style="width: 15%; text-align: right" scope="col">Total Price</th>
                                    </tr>
                                </thead>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table class="table w-100 p3 ms-auto me-auto">
                                <tr>
                                    <td style="width: 10%; text-align: center" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                                    <td style="width: 10%; text-align: center" class="align-middle"><%# Eval("ProductID") %></td>
                                    <td style="width: 20%; text-align: center" class="align-middle"><%# Eval("ProductName")%></td>
                                    <td style="width: 15%; text-align: center" class="align-middle"><%# Eval("Price")%></td>
                                    <td style="width: 10%; text-align: center" class="align-middle"><%# Eval("Quantity")%></td>
                                    <td style="width: 15%; text-align: right" class="align-middle"><%# Eval("TotalPrice")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                    <br />

                    <table style="border: 0px solid transparent;" class="table w-100 p3 ms-auto me-auto">
                        <tr>
                            <td style="width: 15%" class="align-middle"></td>
                            <td style="width: 15%" class="align-middle"></td>
                            <td style="width: 30%"></td>
                            <td style="width: 10%"></td>
                            <td style="width: 10%" class="align-middle">
                                <asp:Label ID="lblSubtotalDis" runat="server" Text="Subtotal"></asp:Label></td>
                            <td style="width: 15%">
                                <asp:Label Style="display: block; text-align: right" ID="lblSubtotal" runat="server" Text="RM???"></asp:Label></td>
                        </tr>

                        <tr>
                            <td style="width: 15%" class="align-middle"></td>
                            <td style="width: 15%" class="align-middle"></td>
                            <td style="width: 30%"></td>
                            <td></td>
                            <td style="width: 15%" class="align-middle">
                                <asp:Label ID="lblTaxDis" runat="server" Text="Tax"></asp:Label>&nbsp;(6%)</td>
                            <td style="width: 15%">
                                <asp:Label Style="display: block; text-align: right" ID="lblTax" runat="server" Text="RM???"></asp:Label></td>
                        </tr>

                        <tr>
                            <td style="width: 15%" class="align-middle"></td>
                            <td style="width: 15%" class="align-middle"></td>
                            <td style="width: 30%"></td>
                            <td></td>
                            <td style="width: 15%" class="align-middle">
                                <asp:Label ID="lblTotalDis" runat="server" Text="Total"></asp:Label></td>
                            <td class="align-middle" style="width: 15%">
                                <asp:Label Style="display: block; text-align: right" ID="lblTotal" runat="server" Text="RM???"></asp:Label></td>


                        </tr>

                    </table>



                    <asp:Button ID="btnMainPage" Style="margin: auto" class="btn btn-danger btn-brand btn-full-width" PostBackUrl="~/App_Pages/OrderHistory.aspx" runat="server" Text="Back to History" />
                </div>
            </article>
        </div>
    </form>

</asp:Content>
