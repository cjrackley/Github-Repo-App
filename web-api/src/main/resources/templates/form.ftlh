<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <main>
        <form method="post" action="/projects/save" enctype="multipart/form-data">
            <label for="title">Project Title</label>
            <input type="text" id="title" name="title" placeholder="e.g. Website Project" required>

            <label for="brief">Project Brief</label>
            <input type="text" id="brief" name="brief" placeholder="e.g. Simple website with css" required>

            <label for="description">Project Description</label>
            <input type="text" id="description" name="description" placeholder="Give a detailed description" required>

            <label for="date">Creation date</label>
            <input type="text" id="date" name="date" placeholder="e.g. June 2026" required>

            <label for="status">Project Status</label>
            <input type="text" id="status" name="status" placeholder="e.g. Incomplete" required>

            <label for="github">Github Repository</label>
            <input type="text" id="github" name="github" placeholder="e.g. https://github.com/cjrackley/project">

            <label for="website">Project Website</label>
            <input type="text" id="website" name="website" placeholder="e.g. https://cjrackley.github.io/project/">

            <label for="projectImageFile">Project Image</label>
            <input type="file" name="projectImageFile" id="projectImageFile" accept="image/*">

            <label for="topics">Project Topics</label>
            <input type="text" id="topics" name="topics" 
            value="<#if project.topics??>${project.topics?join(', ')}</#if>"
            placeholder="e.g. HTML, Agentic Workflows, DB handling">
            <small>Seperate topics with commas.</small>


            <button type="submit">Submit</button>

        </form>
    </main>
</body>
</html>