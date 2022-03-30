//
//  CommentCellView.swift
//  Rave
//
//  Created by Bernie Cartin on 7/26/21.
//

import SwiftUI
import Kingfisher

struct CommentCellView: View {
    // MARK: PROPERTIES
    @State var user: QuickUser?
    
    var comment: Comment
    
    // MARK: BODY
    var body: some View {
        HStack{
            KFImage(URL(string: user?.profileImageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44, alignment: .center)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack {
                    Text(user?.username ?? (user?.name ?? ""))
                        .font(.system(size: 13, weight: .semibold))
                    Text(comment.date?.timeAgoDisplay() ?? "")
                        .font(.system(size: 11))
                }
                Text(comment.comment ?? "")
                    .font(.system(size: 12))
                    .multilineTextAlignment(.leading)
                    .lineLimit(9)
                    .frame(alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .onAppear{
            UserManager().fetchQuickUser(uid: comment.submittedBy ?? "") { user in
                self.user = user
            }
        }
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCellView(comment: Comment(id: "SD"))
            .previewLayout(.sizeThatFits)
    }
}
