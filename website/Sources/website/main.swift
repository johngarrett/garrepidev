Generator.render(ProjectsOverview(), with: "garreπ's projects")
Generator.render(About(), with: "about garreπ")
Generator.render(BlogOverview(), with: "garreπ's blog")

let post =
    Post("How to game on a laptop",
         abstract:
        """
            Everybody hates gaming on a laptop.
            The depependence on windows, the thermal throttling, the weight, etc.
            Why do people still do it and how can this get better?
        """,
         imageURL: "https://preview.redd.it/y5i47rqaob251.png?width=640&height=412&crop=smart&auto=webp&s=2a698b1887157d2a6947a9e1dc9881d7418ddecc",
         Tag(topic: "Windows")
    )
    Generator.render(PostDetailView(with: post), with: post.title)
