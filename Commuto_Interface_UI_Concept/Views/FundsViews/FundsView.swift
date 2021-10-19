//
//  FundsView.swift
//  Commuto_Interface_UI_Concept
//
//  Created by jimmyneutront on 10/3/21.
//

import SwiftUI

struct FundsView: View {
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Balance:")
                    .font(.title2.bold())
                Text("14,634.57")
                    .font(.largeTitle.bold())
                    .foregroundColor(.primary)
                Text("Coin:")
                    .font(.title3.bold())
                Button {
                    
                } label: {
                    HStack(spacing: 15) {
                        Text("All Stablecoins")
                            .font(.title3)
                        Image(systemName: "chevron.down")
                    }
                    .frame(width: 200, height: 60, alignment: .center)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(.gray.opacity(0.7))
                    )
                    .foregroundColor(.black)
                }
            }
            Spacer()
                .frame(height: 30)
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Text("Send")
                            .font(.title3)
                        .frame(width: 95, height: 60, alignment: .center)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(.gray.opacity(0.7))
                        )
                        .foregroundColor(.black)
                    }
                    Button {
                        
                    } label: {
                        Text("Receive")
                            .font(.title3)
                        .frame(width: 95, height: 60, alignment: .center)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(.gray.opacity(0.7))
                        )
                        .foregroundColor(.black)
                    }
                }
                Spacer()
                    .frame(height: 20)
                Button {
                    
                } label: {
                    Text("Transactions")
                        .font(.title3)
                    .frame(width: 200, height: 60, alignment: .center)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(.gray.opacity(0.7))
                    )
                    .foregroundColor(.black)
                }
                Spacer()
                    .frame(height: 10)
                Button {
                    
                } label: {
                    Text("Manage Wallets")
                        .font(.title3)
                    .frame(width: 200, height: 60, alignment: .center)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(.gray.opacity(0.7))
                    )
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct FundsView_Previews: PreviewProvider {
    static var previews: some View {
        FundsView()
    }
}
