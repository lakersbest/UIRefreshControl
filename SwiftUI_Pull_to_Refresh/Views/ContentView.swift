

import SwiftUI

struct ContentView: View {
    
    let refreshControl: RefreshControl = RefreshControl()
    
    var body: some View {
        List {
            ScrollViewResolver(for: refreshControl)
            ForEach(1...50, id: \.self) { eachRowIndex in
                Text("欄位 \(eachRowIndex)")
            }
        }
            .onAppear {
                self.refreshControl.onValueChanged = {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.refreshControl.refreshControl?.endRefreshing()
                    }
                }
            }
    }
}
