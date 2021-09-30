//
//  Recipies.swift
//  Dishlicious (iOS)
//
//  Created by Kejvi Peti on 2021-09-29.
//

import Foundation
import UIKit

let recipiesData : [[String: String]] = [
    
    [
        "image" : "recipe-1",
        "name": "Three Sisters Soup",
        "nativeName": "-",
        "history": "The Three Sisters is a name for the widespread traditional three-crop planting method consisting of corn, beans, and squash, which are planted together. The corn creates a support for the beans to climb, the beans improve the soil by fixing nitrogen, and the squash shades the ground to retain moisture and deter weeds. There are many recipes featuring these three crops together--here is one of them",
        "recipeURL": "https://www.firstnations.org/recipes/three-sisters-soup/",
        "difficulty": "2"
        
    ],
    [
        "image" : "recipe-2",
        "name": "Pemmican",
        "nativeName": "ᐱᒦᐦᑳᓐ",
        "history": "Pemmican is a kind of jerky made from dried meat and fruit. It is easy to store and carry, so has been an important traveling ration in several parts of North America",
        "recipeURL": "https://www.firstnations.org/recipes/pemmican/",
        "difficulty": "1"
    ],
    [
        "image" : "recipe-3",
        "name": "Fry Bread",
        "nativeName": "-",
        "history": "This is a popular contemporary dish with an unfortunate history--when Indigenous peoples were displaced from their traditional lands and ways of life, they had to survive on government-provided rations, which primarily consisted of simple ingredients like flour. ",
        "recipeURL": "https://www.firstnations.org/recipes/grandmas-fry-bread/",
        "difficulty": "1"
    ],
    [
        "image" : "recipe-4",
        "name": "Venison Carpaccio With Cedar Jelly and Sea Buckthorn Jam is the Perfect Appetizer",
        "nativeName": "-",
        "history": "This recipe features unusual some unusual ingredients not usually found in urban Canadian cuisine, but familiar to those living off the land in northern Quebec",
        "recipeURL": "https://www.foodnetwork.ca/shows/great-canadian-cookbook/blog/first-nations-ingredients-with-modern-flair-37887/",
        "difficulty": "3"
    ],
    [
        "image" : "recipe-5",
        "name": "Bannock",
        "nativeName": "-",
        "history": "Various First Nations groups traditionally made flour from corn, nuts, or other sources, but contemporary bannock, like fry bread, tends to feature ingredients common to government rations. You can bake it in an oven, or wrap the dough around a stick and cook it over an open fire.",
        "recipeURL": "https://www.foodnetwork.ca/recipe/traditional-bannock/16288/",
        "difficulty": "1"
    ],
    [
        "image" : "recipe-6",
        "name": "Buffalo Stew",
        "nativeName": "-",
        "history": "Bison (often called buffalo) is a traditional meat animal across the plains and prairies of North America. They are still ranched today!",
        "recipeURL": "https://www.foodnetwork.ca/comfort-food/blog/buffalo-beef-stew/",
        "difficulty": "2"
    ],
    [
        "image" : "recipe-7",
        "name": "Moose Burgers",
        "nativeName": "-",
        "history": "Burgers may not be traditional cuisine, strictly speaking, but moose certainly is to the cultures in the areas where they range! You can sometimes find moose at a specialty butcher, or get it from a friend or family member who hunts.",
        "recipeURL": "https://www.foodnetwork.ca/recipe/moose-burger-with-wild-blueberry-onion-jam/19831/",
        "difficulty": "3"
    ],
    [
        "image" : "recipe-8",
        "name": "West Coast Cedar-Planked Salmon",
        "nativeName": "-",
        "history": "Salmon is of course a very important fish for the peoples of the West Coast, and it can be prepared in many delicious ways. You can get cedar grilling planks in fancy cooking stores. Just make sure you follow the instructions and soak them thoroughly before putting them on the barbecue so they don't catch fire!",
        "recipeURL": "https://www.foodnetwork.ca/recipe/west-coast-cedar-planked-salmon/14386/",
        "difficulty": "2"
    ],
    [
        "image" : "recipe-9",
        "name": "Strawberry Sassafras Glazed Pickerel Over Fiddleheads And Hominy",
        "nativeName": "-",
        "history": "Fiddleheads are a traditional but seasonal ingredient, usually only found in the spring, so check availability before planning this meal (or substitute some other green)",
        "recipeURL": "https://www.chatelaine.com/recipe/main-dishes/strawberry-sassafras-glazed-pickerel/",
        "difficulty": "3"
    ],
    [
        "image" : "recipe-10",
        "name": "Arctic Char Ceviche",
        "nativeName": "-",
        "history": "This recipe is intended to be evocative of quaq, a traditional Inuit dish. Since it is served raw, make sure the fish you get is sashimi-grade!",
        "recipeURL": "https://www.chatelaine.com/recipe/main-dishes/arctic-char-ceviche/",
        "difficulty": "2"
    ],
    [
        "image" : "recipe-11",
        "name": "Sweetgrass Cherry Cake",
        "nativeName": "-",
        "history": "It might take a bit of hunting to find dried sweetgrass braid, but this plant is wonderfully fragrant and has sacred ceremonial use in many Indigenous cultures. As long as you can find the sweetgrass, this should be easy to make.",
        "recipeURL": "https://www.chatelaine.com/recipe/desserts/sweetgrass-cherry-cake/",
        "difficulty": "2"
    ],
    [
        "image" : "recipe-12",
        "name": "Algonquin Wild Nut Soup",
        "nativeName": "Paganens",
        "history": "It's possible this recipe might originally have featured chestnuts instead of hazelnuts, since until a blight wiped out an estimated 3 billion American chestnut trees in the early to mid 20th century rendering the species nearly extinct, they were an abundant and widespread food source across much of North America.",
        "recipeURL": "https://hicookery.com/2010/07/14/paganens-algonquin-wild-nut-soup/",
        "difficulty": "2"
    ],
    [
        "image" : "recipe-13",
        "name": "Sunflower Bannock",
        "nativeName": "Missiiagan-Pakwejigan",
        "history": "Like many native American crops, sunflowers were originally domesticated in Mesoamerica, but were cultivated as far north as southern Canada for their nutritious seeds. One source for this recipe lists it as Mohawk, another as Algonquin. Possibly both groups made this dish since they lived near each other. The recipe directions suggest pan-frying it, but another traditional way of making bannock is to wrap the dough around a stick and cook it over an open flame.",
        "recipeURL": "https://recipeland.com/recipe/v/missiiagan-pakwejigan-sunflower-17324",
        "difficulty": "3"
    ],
    [
        "image" : "recipe-14",
        "name": "Iroquois Fish Soup",
        "nativeName": "Unega'gei",
        "history": "The Iroquois are a confederacy of peoples living in what is now Southern Ontario and Quebec and the northeastern United States. Fish is an important traditional staple food especially for those living around the Great Lakes.",
        "recipeURL": "https://www.food.com/recipe/unegagei-306936",
        "difficulty": "1"
    ],
    [
        "image" : "recipe-15",
        "name": "Berry Drink",
        "nativeName": "Mee-Ni-Sha-Piy",
        "history": "Depending on the region, different berries or other small fruit are available, so find out what grows traditionally where you are! Cranberries, blueberries, salmonberries, strawberries, and chokecherries are all native to various parts of Canada.",
        "recipeURL": "https://www.refinery29.com/en-ca/2021/06/10498745/indigenous-chefs-recipes#slide-6",
        "difficulty": "1"
    ],
    [
        "image" : "recipe-16",
        "name": "Wild Berry Sauce",
        "nativeName": "Thíŋpsiŋla Wóžapi",
        "history": "This Lakota-inspired recipe calls for flour made from the timpsila or prairie turnip, but you can substitute a different starch thickener such as cornstarch or arrowroot.",
        "recipeURL": "https://foragerchef.com/wild-berry-thinpsinla-wozapi/",
        "difficulty": "1"
    ],
    [
        "image" : "recipe-17",
        "name": "Traditional Pi'kwun Salmon",
        "nativeName": "-",
        "history": "This is meant to be cooked over an open fire on wooden stakes. The tricky part is deboning the salmon and spreading it apart into two halves while still leaving it whole.",
        "recipeURL": "https://www.bakespace.com/recipes/detail/Traditional-Pi%27kwun-Salmon/69899/",
        "difficulty": "3"
    ],
    [
        "image" : "recipe-18",
        "name": "Métis Boulettes",
        "nativeName": "-",
        "history": "This meatball soup is a traditional New Year's recipe for many Métis people.",
        "recipeURL": "https://www.cbc.ca/life/food/metis-boulettes-1.5044911",
        "difficulty": "3"
    ]
]
    
struct Recipies {

    static func getRecipiesForDificulty(difficulty: String, f: String, s: String) -> [[String: String]] {
        return recipiesData
            .filter{ recipe in
                let r = recipe["difficulty"] ?? ""
                if r == difficulty{
                    return true
                }
                return false
            }
            .filter{!$0.values.contains(f)}
            .filter{!$0.values.contains(s)}
    }
    
    static func getRecipe(with difficulty: String) -> [String]{
        var recipe = recipiesData.filter{ recipe in
            let r = recipe["difficulty"] ?? ""
            if r == difficulty{
                return true
            }
            return false
        }
        let firstImage = recipe.randomElement()?["image"] ?? ""
        recipe = recipiesData.filter{ recipe in
            let r = recipe["difficulty"] ?? ""
            if r == difficulty{
                return true
            }
            return false
        }
            .filter{!$0.values.contains(firstImage)}
        let secondImage =  recipe.randomElement()?["image"] ?? ""
        return [firstImage, secondImage]
    }
    
    
}

//Template for data entry
//,
//[
//    "image" : "Image",
//    "name": "dishName",
//    "nativeName": "nativeDishName",
//    "history": "history",
//    "recipeURL": "URL",
//    "difficulty": "2"
//]
