call flutter build web --base-href /JDRWesh/ --web-renderer canvaskit --release
call del /s /q docs
call rmdir /s /q docs
call mkdir docs
call robocopy build/web docs /s /e
call git add .
call git commit -m "publish pages"
call git push
pause