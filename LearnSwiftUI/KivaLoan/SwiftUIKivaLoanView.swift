//
//  SwiftUIKivaLoanView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/5.
//

import SwiftUI

struct SwiftUIKivaLoanView: View {
    
    @ObservedObject var loanStore = LoanStore()
    @State private var filterEnabled = false
    @State private var maximumLoanAmount = 10000.0
    
    var body: some View {
        NavigationStack {
            if filterEnabled {
                LoanFilterView(amount: $maximumLoanAmount)
                    .transition(.opacity)
            }
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                    .padding(.vertical, 5)
            }
            .navigationTitle("Kiva Loan")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.linear) {
                            self.filterEnabled.toggle()
                            self.loanStore.filterLoans(maxAmount: Int(maximumLoanAmount))
                        }
                    } label: {
                        Text("Filter")
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
        .task {
            self.loanStore.fetchLatestLoans()
        }
    }
}

#Preview {
    SwiftUIKivaLoanView()
}
