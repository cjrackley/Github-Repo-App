<!doctype html>
<html lang="en" data-bs-theme="dark">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description" content="" />
  <title>Details Page</title>
  <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/theme.css" rel="stylesheet" />
  <link href="/style.css" rel="stylesheet" />
  <link href="/detail-style.css" rel="stylesheet" />
  <meta name="theme-color" content="#712cf9" />

</head>

<body>
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