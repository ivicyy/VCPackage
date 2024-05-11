import Alamofire
import Foundation

public class HttpManage<T:Codable> {
    
    public init(){}
    
    public func requset(url:String,para:[String: Any],complete:@escaping(_ response:T)->(),failure:@escaping(_ error:Error)->()) {
        let headers: HTTPHeaders = ["accept": "application/json","Content-Type": "application/json",]
        AF.request(url,method: .post,parameters: para,encoding: JSONEncoding.default,headers: headers).responseDecodable(of:T.self) { resonse in
            switch resonse.result {
            case .success(let data):
                print("返回数据:",data)
                let decoder = JSONDecoder()
                do {
                    let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
                    let jsonModel = try decoder.decode(T.self, from: jsonData!)
                    complete(jsonModel)
                }catch {
                    print("JSON解析失败")
                }
                break
            case .failure(let error):
                failure(error)
                print(error)
                break
            }
        }
    }
}

