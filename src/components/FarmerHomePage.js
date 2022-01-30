import React, { Component } from 'react';

class FarmerHomePage extends Component {

    render() {
        return (
            <div id="content">
                <h1>Add Product</h1>
                <form onSubmit={(event) => {
                    event.preventDefault()
                    const productName = this.productName.value
                    const productPrice = window.web3.utils.toWei(this.productPrice.value)
                    this.props.createProduct(productName, productPrice)
                }
                }>
                    <div className="form-group mr-sm-2">
                        <input
                            id="productName"
                            type="text"
                            ref={(input) => { this.productName = input }}
                            className="form-control"
                            placeholder="Product Name"
                            required
                        />
                    </div>
                    <div className="form-group mr-sm-2">
                        <input
                            id="productPrice"
                            type="text"
                            ref={(input) => { this.productPrice = input }}
                            className="form-control"
                            placeholder="Product Price"
                            required
                        />
                    </div>
                    <button type="submit" className="btn btn-primary">Add Products</button>
                </form>
                
                <p>&nbsp;</p>
                <h2>Buy Product</h2>
                <table className="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Owner</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody id="productList">
                        {this.props.productDetails.map((product, key) => {
                            return (
                                <tr key={key}>
                                    <th scope="row">{product.productId.toString()}</th>
                                    <td>{product.productName}</td>
                                    <td>{window.web3.utils.fromWei(product.productPrice.toString(), 'Ether')} Eth</td>
                                    <td>{product.owner.toString()}</td>
                                    <td>
                                        { !product.purchased ?
                                        <button 
                                        name={product.productId}
                                        value={product.productPrice}
                                        onClick={(event)=> {
                                            this.props.purchaseProduct(event.target.productName, event.target.purchase)
                                        }}>
                                        Buy
                                        </button>
                                        :null
                                        }
                                        </td>
                                </tr>
                            )
                        })}
                    </tbody>
                </table>
            </div>
            
        );
    }
}

export default FarmerHomePage;