python -m venv .venv
$env:VIRTUAL_ENV = "$PWD\.venv"
$env:PATH = "$PWD\.venv\Scripts;$env:PATH"
python -m pip install -q -U pip --no-cache-dir
python -m pip install -q -r requirements.txt --no-cache-dir
python -m pip install -q --upgrade 'dill>=0.4,<1.0' --no-cache-dir
python -c "import glob, subprocess; [subprocess.run(['jupytext', '--to', 'notebook', f]) for f in glob.glob('notebooks/[0-9]*.py')]"
if (-not (Test-Path .env)) { Copy-Item .env.example .env }
python scripts/seed_corpus.py
python scripts/gen_agent_queries.py
python scripts/gen_spend.py
python scripts/verify_lite.py
