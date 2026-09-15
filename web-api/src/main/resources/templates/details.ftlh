<!doctype html>
<html lang="en" data-bs-theme="dark">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description" content="" />
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
  <meta name="generator" content="Astro v5.13.2" />
  <title>Details Page</title>
  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/" />
  <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/theme.css" rel="stylesheet" />
  <link href="/style.css" rel="stylesheet" />
  <link href="/detail-style.css" rel="stylesheet" />
  <meta name="theme-color" content="#712cf9" />

</head>

<body>
  <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="check2" viewBox="0 0 16 16">
      <path
        d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z">
      </path>
    </symbol>
    <symbol id="circle-half" viewBox="0 0 16 16">
      <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"></path>
    </symbol>
    <symbol id="moon-stars-fill" viewBox="0 0 16 16">
      <path
        d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z">
      </path>
      <path
        d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z">
      </path>
    </symbol>
    <symbol id="sun-fill" viewBox="0 0 16 16">
      <path
        d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z">
      </path>
    </symbol>
  </svg>
  </div>
  <#include "fragments/header.ftlh">
  <main>
    <div class="album py-5 bg-body-tertiary">
      <div class="container" id="main-container">

        <a class="back-link" href="/projects">&larr; Back to Projects</a>
        <div id="title-section">
          <div class="detail-left">
            <div class="page-title">
              <h1>${project.title}</h1>
              <span class="page-year">${(project.date)!"-"}</span>
            </div>

            <div class="info-card">
              <div class="info-row">
                <span class="label">Status</span>
                <span class="value status-complete">${(project.status)!"Unknown"}</span>
              </div>
              <div class="info-row">
                <span class="label">Languages &amp; Topics</span>
                <#if (project.topics)?has_content>
                  ${project.topics?join(", ")}
                  <#else>
                    <span class="value">-</span>
                </#if>
              </div>
              <div class="info-row">
                <span class="label">GitHub</span>
                <#if (project.github)?has_content>
                  <span class="value"><a href="${project.github}">Repo</a></span>
                  <#else>
                    <span class="value">No Repo</span>
                </#if>
              </div>
              <div class="info-row">
                <span class="label">Website</span>
                <#if (project.website)?has_content>
                  <span class="value"><a href="${project.website}">Live site</a></span>
                  <#else>
                    <span class="value">No Website</span>
                </#if>
              </div>
            </div>
          </div>

          <img class="detail-img" src="/projects/picture/${project.id?c}" alt="${project.title}" onerror="this.src='/question.jpg'">

        </div>

        <div class="description-box">
          <p>${(project.description)!"No Description."}</p>
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