<!doctype html>
<html lang="en" data-bs-theme="dark">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description" content="" />
  <meta name="author" content="Cameron Rackley" />
  <title>Portfolio Page</title>
  <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/style.css" rel="stylesheet" />
  <link href="/theme.css" rel="stylesheet" />
  <meta name="theme-color" content="#712cf9" />

</head>

<body>
  <#include "fragments/header.ftlh">
  <main>
    <section id="hero" class="text-center container">
      <div class="row">
        <div class="col-lg-6 col-md-7 mx-auto">
          <h1 class="fw-light">Welcome!</h1>
          <p class="lead text-body-secondary">
            Below is a list of any projects I've either completed or that are still in progress. Most projects are
            available on GitHub and a link will be provided, if there is a project with no GitHub link it most likely
            does not have one.
          </p>
          <p>
            <a href="https://www.linkedin.com/in/cameron-rackley-131a20303/" class="btn btn-primary my-2">LinkedIn
              Page</a>
            <a href="https://github.com/cjrackley" class="btn btn-secondary my-2">GitHub Page</a>
          </p>
        </div>
      </div>
    </section>
    <div class="album py-5 bg-body-tertiary">
      <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <#list projectList as project>
              <div class="col">
                <div class="card shadow-sm">

                  <img class="card-img-top" height="225" src="/projects/picture/${project.id?c}" alt="${project.title}">
                  <title>${project.title}</title>
                  <div class="card-body">
                    <p class="card-text">
                      <b>${project.title}</b> <br> ${project.brief}
                    </p>
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="btn-group">
                        <a href="/projects/details/${project.id?c}"><button type="button"
                            class="btn btn-sm btn-outline-secondary">
                            View
                          </button></a>
                      </div>
                      <small class="text-body-secondary"><a href="${project.github}">GitHub</a></small>
                    </div>
                  </div>
                </div>
              </div>
            <#else>
              <div class="col-12 text-center text-body-secondary py-5">
                <p>No projects to show yet.</p>
              </div>
            </#list>              
        </div>
      </div>
    </div>
  </main>
  <footer class="text-body-secondary py-5">
    <div class="container">
      <p class="float-end mb-1"><a href="#">Back to top</a></p>
      <p class="mb-1">
        Template used from &copy; Bootstrap and modified by Cameron Rackley
      </p>
      <p class="mb-0">
        New to Bootstrap? <a href="/">Visit the homepage</a> or read our
        <a href="../getting-started/introduction">getting started guide</a>.
      </p>
    </div>
  </footer>

  <#include "fragments/resume-modal.ftlh">
</body>

</html>