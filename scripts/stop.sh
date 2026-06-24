#!/bin/bash
pgrep -f 'app.jar' && pkill -f 'app.jar' || true
exit 0