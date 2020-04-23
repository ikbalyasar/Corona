//
//  MapViewController.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//


import Foundation
import UIKit
import MapKit


final class MapViewController : BaseViewController {
    
    private var mapCorona: [Map] = []
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var shareButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupUI()
        viewModel.load()
    }
    
    func setupUI(){
        if #available(iOS 10.3, *) {
            kReviewMe().showReviewView(afterMinimumLaunchCount: 2)
        }else{
            // Review View is unvailable for lower versions. Please use your custom view.
        }
        self.shareButton.addShadow(opacitiy: 0.7, shadowRadius: 10, shadowOffsetWidth: 1, shadowOffsetHeight: 1, shadowColor: .darkGray)
        self.shareButton.addCornerRadius(cornerRadius: 26)
    }
    
    var viewModel: MapViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    @IBAction func shareButton(_ sender: Any) {
           if var top = self.view?.window?.rootViewController {
               while let presentedViewController = top.presentedViewController {
                   top = presentedViewController
               }
               let activityVC = UIActivityViewController(activityItems: ["itms-apps (Ymnlendirme kodu yazılacak)"], applicationActivities: nil)
               activityVC.popoverPresentationController?.sourceView = view
               top.present(activityVC, animated: true, completion: nil)
           }
    }
    
    func addRadiusCircle(location: CLLocationCoordinate2D){
        self.mapView.delegate = self
        let circle = MKCircle(center: location, radius: 100000)
        self.mapView.addOverlay(circle)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.barStyle = .default
    }
}

extension MapViewController : MapViewModelDelegate {
    func handleViewModelOutput(_ output: MapViewModelOutput) {
        switch output {
        case .showCorona(let mapCorona):
            self.mapCorona = mapCorona

            for map in mapCorona {
                let coord = CLLocationCoordinate2D(latitude: Double(map.lat)!, longitude: Double(map.long)!)
                let mkCircle1 = MKCircle(center: coord, radius: CLLocationDistance(exactly: 100000.0)!)
                
                var detailsString: NSAttributedString? {
                    let descriptor = UIFontDescriptor
                        .preferredFontDescriptor(withTextStyle: .footnote)
                        .withSymbolicTraits(.traitBold)
                    let boldFont = UIFont(descriptor: descriptor!, size: 0)
                    
                    let string = NSMutableAttributedString()
                    string.append(.init(string: "Confirmed: ".localized ,
                                        attributes: [.foregroundColor: UIColor.systemOrange, .font: boldFont]))
                    
                    string.append(.init(string: "\n" + ("Dead: ".localized),
                                        attributes: [.foregroundColor : UIColor.systemYellow, .font: boldFont]))
                    
                    string.append(.init(string: "\n" + ("Recovry: ".localized),
                                        attributes: [.foregroundColor : UIColor.systemGreen, .font: boldFont]))
                    return string
                }
                let attributedText = NSMutableAttributedString(string: "Confirmed: ".localized, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
                attributedText.append(customizeColor(string: " (\(map.confirmedCount))", color: #colorLiteral(red: 0.9411764706, green: 0.3803921569, blue: 0.4117647059, alpha: 1)))
                
                let annotation = MKPointAnnotation()
                let trimCountryName = map.name.replacingOccurrences(of: " ", with: "")
                let fullName = trimCountryName.replacingOccurrences(of: "/", with: " / ")
                annotation.title =  fullName.localized
                let con = "Confirmed: ".localized
                let dead = "Dead: ".localized
                let rec = "Recovry: ".localized
                annotation.subtitle = con + "\(map.confirmedCount)\n" + dead + "\(map.deathCount)\n" + rec + "\(map.recovryCount)"
                annotation.coordinate = coord
                self.mapView.addAnnotation(annotation)
                self.mapView.addOverlay(mkCircle1)
                
            }
        case .setLoading(let isLoading):
            guard isLoading == true else {
                return self.hideActivity()
            }
            showActivity()
        }
    }
    
    func navigate(to route: MapRoute) {
        
    }
    func  customizeColor(string: String, color: UIColor) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: string, attributes:
            [NSAttributedString.Key.foregroundColor : color ])
    }
    
    
}

extension MapViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let circleOverlay = overlay as? MKCircle {
            let mkCircleRenderer = MKCircleRenderer(circle: circleOverlay)
            mkCircleRenderer.fillColor = #colorLiteral(red: 0.1560963988, green: 0.1428621411, blue: 0.3424518406, alpha: 1).withAlphaComponent(0.5)
            mkCircleRenderer.strokeColor = #colorLiteral(red: 0.4127346277, green: 0.3587111831, blue: 1, alpha: 1)
            mkCircleRenderer.lineWidth = 1
            return mkCircleRenderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        } else {
            
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "coronaS")
            annotationView.canShowCallout = true
            annotationView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            
            let label1 = UILabel()
            label1.text = annotation.subtitle!
            label1.numberOfLines = 0
            annotationView.detailCalloutAccessoryView = label1;
            
            let width = NSLayoutConstraint(item: label1, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
            label1.addConstraint(width)
            
            
            let height = NSLayoutConstraint(item: label1, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 90)
            label1.addConstraint(height)
            
            return annotationView
            
            
        }
    }
}


private class DetailsView: UIView {
    private lazy var titleLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .footnote), size: 0)
        label.text = "\(100):\n\(200):\n\(300):\n\(400):"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var detailsLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .footnote), size: 0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var forFirstBaselineLayout: UIView { titleLabel }
    override var forLastBaselineLayout: UIView { titleLabel }
    
    init() {
        super.init(frame: .zero)
        
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeView() {
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        addSubview(detailsLabel)
        detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        detailsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.trailingAnchor.constraint(equalTo: detailsLabel.leadingAnchor, constant: -5).isActive = true
    }
}


