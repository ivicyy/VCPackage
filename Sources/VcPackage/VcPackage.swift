import Alamofire
import Foundation

public class HttpManage<T:Codable> {
    
    public init(){}
    
    public func requset(url:String,para:[String: Any],complete:@escaping(_ response:T)->(),failure:@escaping(_ error:Error)->()) {
        let headers: HTTPHeaders = ["accept": "application/json","Content-Type": "application/json",]
        AF.request(url,method: .post,parameters: para,encoding: JSONEncoding.default,headers: headers).responseDecodable(of:T.self) { resonse in
            print("请求url:",resonse.request?.url ?? "")
            print("请求header:",resonse.request?.headers ?? "")
            print("请求参数:",para)
            switch resonse.result {
            case .success(let data):
                //反向解析打印返回数据
                do {
                    let jsonData = try JSONEncoder().encode(resonse.value)
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        print("返回数据:",jsonString)
                    }
                } catch {
                    print("JSON解析失败: \(error)")
                }
                complete(data)
                break
            case .failure(let error):
                failure(error)
                print(error)
                break
            }
        }
    }
}

