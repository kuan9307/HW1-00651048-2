//
//  ContentView.swift
//  HW1-00651048
//
//  Created by User01 on 2021/3/5.
//

import SwiftUI

var Question1:[String] = ["長的少，短的多，腳去踩，手去摸(提示:日常用品)",           //1
                    "看看沒有，摸摸倒有，似冰不化，似水不流(提示:日常用品)",
                    "兩姐妹，一樣長，酸甜苦辣她先嚐(提示:日常用品)",
                    "在家臉上白，出門臉上花，遠近都能到，一去不回家(提示:日常用品)",
                    "身小力不小，團結又勤勞。有時搬糧食，有時挖地道。(提示:動物)",     //5
                    "說馬不像馬，路上沒有它。若用它做藥，要到海中抓。(提示:動物)",
                    "黑臉包丞相，坐在大堂上。扯起八卦旗，專拿飛天將。(提示:動物)",
                    "吃進的是草，擠出的是寶。捨己為人類，功勞可不小(提示:動物)",
                    "百姐妹，千姐妹，同床睡，各蓋被(提示:水果)",
                    "左手五個，左手五個。拿去十個，還剩十個(提示:日常用品)",         //10
                    "一物生得巧，地位比人高。戴上御風寒，脫下有禮貌(提示:日常用品)",
                    "屋裡一座亭，亭中有個人，天天盪鞦韆，不盪就有病(提示:日常用品)",
                    "頭上亮光光，出門就成雙。背上縛繩子，馱人走四方(提示:日常用品)",
                    "不是點心不是糖,軟軟涼涼肚裡藏,不能吃來不能喝,每天也要嘗一嘗(提示:日常用品)",
                    "樓台接樓台，一層一層接起來，上面冒白氣，下面水開花(提示:日常用品)",   //15
                    "一間小藥房，藥品裡面藏。房子塗白色，十字畫中央(提示:日常用品)",
                    "薄薄一張口，能啃硬骨頭。吃肉不喝湯，吃瓜不嚼豆(提示:日常用品)",
                    "有硬有軟，有長有寬。白天空閒，夜晚上班(提示:日常用品)",
                    "遠看兩個零，近看兩個零。有人用了行不得，有人不用不得行(提示:日常用品)",
                    "前面來只船，舵手在上邊，來時下小雨，走後路已乾(提示:日常用品)"]

var Answer:[String] = ["梯子","鏡子","筷子","信","螞蟻","海馬","蜘蛛","奶牛","石榴","手套",
                       "帽子","鐘擺","皮鞋","牙膏","蒸籠","醫藥箱","菜刀","床","眼鏡","熨斗"]

var Sequence:[Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] //題目順序

struct ContentView: View {
    @State private var AnswearShow = false
    @State private var number = 0
    @State private var showingAlert = false
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text("第" + String(number+1) + "題")
                    .font(.title).foregroundColor(.white).multilineTextAlignment(.center).padding()
                Spacer()
            }.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            
            Text(Question1[Sequence[number]]).padding()
            
            HStack{
                
                Button(action: {
                    AnswearShow = true
                },label: {
                    Text("顯示答案")
                        .font(.title2)
                
                }).padding()
                if AnswearShow == true {
                    Text(Answer[Sequence[number]])
                }
                
            }
            
            Image("car1")
            .resizable()
            .scaledToFit()
          
            HStack{
                Button(action: {
                  
                    if(number > 8){
                        showingAlert = true
                        Sequence.shuffle()
                        number = 0
                    }else{
                        number = number + 1
                        AnswearShow = false
                    }
                  
                },label: {
                    Text("下一題")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10.0)
                        
                }).padding(30)
                
                Button(action: {
                    Sequence.shuffle()
                    number = 0
                    AnswearShow = false
                },label: {
                    Text("重新選10題")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10.0)
                }).alert(isPresented: $showingAlert) { () -> Alert in
                    let answer = "已經超過１０題囉！將會重新選擇１０題"
                    return Alert(title: Text(answer))
                }.padding(30)
            }
            
        }.onAppear(perform: {
            Sequence.shuffle()
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

