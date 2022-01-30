import React, { Component } from 'react';
import './Login.css';

class Login extends Component {

    render() {
        return (
            <div className="container">
                <h1>Farmer Signup</h1>
                <form onSubmit={(event) => {
                    event.preventDefault()
                    const farmerName = this.farmerName.value
                    const farmerAadharNumber = this.farmerAadharNumber.value
                    const farmerMobileNumber = this.farmerMobileNumber.value
                    this.props.addFarmer(farmerName, farmerAadharNumber, farmerMobileNumber)
                }
                }>
                    <div className="input-field">
                        <input
                            id="farmerName"
                            type="text"
                            ref={(input) => { this.farmerName = input }}
                            className="form-control"
                            placeholder="Name"
                            required
                        />
                    </div>
                    <div className="input-field">
                        <input
                            id="aadharNumber"
                            type="number"
                            ref={(input) => { this.farmerAadharNumber = input }}
                            className="form-control"
                            placeholder="Aadhar Number"
                            required
                        />
                    </div>
                    <div className="input-field">
                        <input
                            id="mobileNumber"
                            type="number"
                            ref={(input) => { this.farmerMobileNumber = input }}
                            className="form-control"
                            placeholder="Mobile Number"
                            required
                        />
                    </div>
                    <div className="button">
                        <div className="inner"></div>
                                <button type="submit">Signup</button>
                    </div>
                </form>
                
            </div>
        );
    }}
export default Login;