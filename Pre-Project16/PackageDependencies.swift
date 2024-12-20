//
//  PackageDependencies.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 10/12/24.
//

/*Anyway, the first step is to add the package to our project: go to the File menu and choose Add Package Dependencies. For the URL enter https://github.com/twostraws/SamplePackage, which is where the code for my example package is stored. Xcode will fetch the package, read its configuration, and show you options asking which version you want to use. The default will be “Version – Up to Next Major”, which is the most common one to use and means if the author of the package updates it in the future then as long as they don’t introduce breaking changes Xcode will update the package to use the new versions.
 
 The reason this is possible is because most developers have agreed a system of semantic versioning (SemVer) for their code. If you look at a version like 1.5.3, then the 1 is considered the major number, the 5 is considered the minor number, and the 3 is considered the patch number. If developers follow SemVer correctly, then they should:

 Change the patch number when fixing a bug as long as it doesn’t break any APIs or add features.
 Change the minor number when they added features that don’t break any APIs.
 Change the major number when they do break APIs.
 This is why “Up to Next Major” works so well, because it should mean you get new bug fixes and features over time, but won’t accidentally switch to a version that breaks your code.
 
 */

import SwiftUI
import SamplePackage

struct PackageDependencies: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    PackageDependencies()
}
