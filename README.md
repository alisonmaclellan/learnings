
# Learnings Site (MkDocs + GitHub Pages)

This starter gives you a ready-to-publish site. You only need a GitHub repo; the included workflow builds and deploys to **GitHub Pages** on every push to `main`.

## Quick start

### Option A – GitHub Web UI
1. Create a new repository (e.g., `learnings-site`).
2. Upload the contents of this starter (keep the folder structure).
3. Go to **Settings → Pages** and ensure **Source = GitHub Actions** (default after first successful run).
4. Push a change (or use the included files). The workflow publishes your site automatically.

### Option B – Git CLI
```bash
# replace <YOUR-REPO> with your repo name
rm -rf .git
git init
git add .
git commit -m "Starter: MkDocs + Pages"
git branch -M main
git remote add origin https://github.com/<YOUR-USER>/<YOUR-REPO>.git
git push -u origin main
```

After the first push, check **Actions** for the "Deploy MkDocs to GitHub Pages" workflow. When it completes, the site URL appears under **Settings → Pages**.

## Edit from your phone
- Use the **GitHub mobile app** (iOS/Android) to add or edit files under `docs/notes/`.
- Commit to `main` to trigger a new deploy.

## Add a new note
Create `docs/notes/YYYY-MM-DD.md` with your content. Update `mkdocs.yml` `nav:` if you want it listed in the sidebar, or rely on the Notes index page (optional enhancement).

## Loop → GitHub
- In Loop, copy content as **Markdown** and paste into a new `docs/notes/<date>.md`.
- For bulk moves, export to Word and convert to Markdown locally with `pandoc`, then commit.

## Customize
- Update `site_name` and `site_url` in `mkdocs.yml`.
- Add navigation under `nav:`.
- Choose another theme or palette using MkDocs Material options.

## Local preview (optional)
```bash
python -m pip install mkdocs mkdocs-material
mkdocs serve
# open http://127.0.0.1:8000
```
