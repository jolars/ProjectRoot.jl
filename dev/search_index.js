var documenterSearchIndex = {"docs":
[{"location":"api/#API-Reference","page":"API Reference","title":"API Reference","text":"","category":"section"},{"location":"api/","page":"API Reference","title":"API Reference","text":"ProjectRoot.ProjectRoot\nProjectRoot.@projectroot","category":"page"},{"location":"api/#ProjectRoot.ProjectRoot","page":"API Reference","title":"ProjectRoot.ProjectRoot","text":"module ProjectRoot\n\nThis module provides a macro to build paths relative to the root directory of the project.\n\n\n\n\n\n","category":"module"},{"location":"api/#ProjectRoot.@projectroot","page":"API Reference","title":"ProjectRoot.@projectroot","text":"@projectroot(args...)\n\nThis macro returns a path relative to the root directory of the project.\n\n\n\n\n\n","category":"macro"},{"location":"#ProjectRoot.jl","page":"Home","title":"ProjectRoot.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"A package for Julia that provides easy file-referencing for project-oriented workflows.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"You can install the package using the Julia package manager from the source code on GitHub:","category":"page"},{"location":"","page":"Home","title":"Home","text":"using Pkg\nPkg.add(\"https://github.com/jolars/ProjectRoot.jl\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"A stable release will be available on the Julia package registry soon.","category":"page"},{"location":"#Getting-Started","page":"Home","title":"Getting Started","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The package provides a single macro, @projectroot, that can be used to reference files in your project. The idea is to in some file A.jl be able to reference another file B.jl somewhere else in your project without having to care where file A.jl is or need to update the reference if you move A.jl somewhere else.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Take this example project:","category":"page"},{"location":"","page":"Home","title":"Home","text":"MyProject\n├── scripts\n│   └── A.jl\n├── src\n│   └── B.jl\n└── Project.toml","category":"page"},{"location":"","page":"Home","title":"Home","text":"If you want to include B.jl from A.jl, all you need to do is this:","category":"page"},{"location":"","page":"Home","title":"Home","text":"include(@projectroot(\"src\", \"B.jl\"))","category":"page"},{"location":"","page":"Home","title":"Home","text":"Now, calling A.jl from anywhere in your project will work as expected. And if you move A.jl to another folder, say scripts/subfolder, the import will still work.","category":"page"},{"location":"","page":"Home","title":"Home","text":"@projectroot also handles calling lines from A.jl through the REPL, by fetching the current working directory.","category":"page"},{"location":"#How-Does-it-Work?","page":"Home","title":"How Does it Work?","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The @projectroot macro works by fetching the current file from where it is called and then recursively search upwards in the file hierarchy until it finds one of the following:","category":"page"},{"location":"","page":"Home","title":"Home","text":"A .projectroot file\nA Project.toml file\nA JuliaProject.toml file\nA Manifest.toml file\nA .git folder\nA .svn folder","category":"page"},{"location":"","page":"Home","title":"Home","text":"It stops searching when it finds one of these files or when you reach the root of the file system.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The .projectroot file is just a file that allows you to manually specify the root of your project and its contents will be ignored.","category":"page"},{"location":"","page":"Home","title":"Home","text":"If @projectroot is called from the REPL, it will instead simply return the current working directory (result of calling pwd()).","category":"page"},{"location":"#Acknowledgements","page":"Home","title":"Acknowledgements","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This package is inspired by similar packages for other languages, such as the R package here and the Python package pyprojroot.","category":"page"},{"location":"#Alternatives","page":"Home","title":"Alternatives","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The excellent DrWatson.jl package provides the same functionality as ProjectRoot but also much more. The motivation for this package was to provide a simpler alternative for those who do not need all the bells and whistles.","category":"page"}]
}