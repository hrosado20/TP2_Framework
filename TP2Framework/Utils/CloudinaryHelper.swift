//
//  CloudinaryHelper.swift
//  TP2Framework
//
//  Created by Hugo Andres on 22/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Cloudinary

public class CloudinaryHelper {
    private static let cloudinaryUrl: String = "cloudinary://168917329637446:OctpP6SJRAeJslNss6_C2Bh5HUU@hci2tbmk0"
    
    // EXAMPLE: Not working because unsigned uploadas is disable
//    CloudinaryHelper.cloudinary.createUploader().upload(data: UIImagePNGRepresentation(request.userImageView.image!)!, uploadPreset: "user_preset", params: nil, progress: { (_) in
//
//    }) { (response, error) in
//    print("response: \(response?.url)")
//    print("error: \(error?.description)")
//    }
    
    public static func uploadUserImage(fromImage image: UIImage, progress: @escaping (Progress?) -> Void, success: @escaping (String?) -> Void) -> Void {
        let config: CLDConfiguration = CLDConfiguration(cloudinaryUrl: cloudinaryUrl)!
        let cloudinary:CLDCloudinary = CLDCloudinary(configuration: config)
        
        let params: CLDUploadRequestParams = CLDUploadRequestParams().setUploadPreset(Constants.cloudinary.userPreset)
        cloudinary.createUploader().signedUpload(data: UIImagePNGRepresentation(image)!, params: params, progress: progress) { (response, error) in
            if error == nil {
                success(response!.url)
            }
        }
    }
    
    public static func uploadPromotionImage(fromImage image: UIImage, progress: @escaping (Progress?) -> Void, success: @escaping (String?) -> Void) -> Void {
        let config: CLDConfiguration = CLDConfiguration(cloudinaryUrl: cloudinaryUrl)!
        let cloudinary:CLDCloudinary = CLDCloudinary(configuration: config)
        
        let params: CLDUploadRequestParams = CLDUploadRequestParams().setUploadPreset(Constants.cloudinary.promotionPreset)
        cloudinary.createUploader().signedUpload(data: UIImagePNGRepresentation(image)!, params: params, progress: progress) { (response, error) in
            if error == nil {
                success(response!.url)
            }
        }
    }
    
    public static func uploadProductImage(fromImage image: UIImage, progress: @escaping (Progress?) -> Void, success: @escaping (String?) -> Void) -> Void {
        let config: CLDConfiguration = CLDConfiguration(cloudinaryUrl: cloudinaryUrl)!
        let cloudinary:CLDCloudinary = CLDCloudinary(configuration: config)
        
        let params: CLDUploadRequestParams = CLDUploadRequestParams().setUploadPreset(Constants.cloudinary.productPreset)
        cloudinary.createUploader().signedUpload(data: UIImagePNGRepresentation(image)!, params: params, progress: progress) { (response, error) in
            if error == nil {
                success(response!.url)
            }
        }
    }
    
}
