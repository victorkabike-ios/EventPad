//
//  EventDetail.swift
//  spike
//
//  Created by victor kabike on 2022/07/03.
//

import SwiftUI

struct EventDetail: View {
    var event: Events
    var body: some View {
        HStack{
            Image(systemName: "map.fill")
                .foregroundColor(.white)
                .font(.title3)
                .padding()
                .background(Color(uiColor: .systemGreen), in: Circle())
            VStack(alignment: .leading){
                Text(event.title ?? "")
                    .font(.title3.bold())
                Text(event.location ?? "")
                    .font(.callout)
                    .fontWeight(.medium)
                Text(event.about ?? "")
                    .font(.caption)
                
            }.frame(maxWidth: .infinity)
            Text(event.date!.formatted(date: .abbreviated, time: .omitted) )
                .padding(.trailing)
            Image(systemName: event.isReminderOn ? "bell.fill" : "bell.slash")
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

