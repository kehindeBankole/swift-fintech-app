    //
    //  OnboardData.swift
    //  omi
    //
    //  Created by kehinde on 11/11/2023.
    //

    import Foundation

    struct OnboardingStep : Hashable{
        let image:String
        let title:String
        let subtitle:String
    }

    let OnboardStep  = [
        OnboardingStep(image: "image-one", title: "Hello! It's new OmSTU application" , subtitle: "View the schedule of classes without RUZ errors"),
        OnboardingStep(image: "image-two", title: "Quick search by university" , subtitle: "View the schedule of classes without RUZ errors") ,
        OnboardingStep(image: "image-three", title: "Notifications About the start of classes" , subtitle: "View the schedule of classes without RUZ errors") ,]

    let onboardKey = "hasFinishedOnboarding"
