# Suspend/resume issues

## Error on resume
```
amdgpu 0000:2f:00.0: [drm] *ERROR* Failed to allocate phantom plane.
# ...
amdgpu 0000:2f:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic data
# ...
amdgpu 0000:2f:00.0: [drm] *ERROR* Error queueing DMUB command: status=2
```


## Links
* https://community.frame.work/t/amdgpu-error-queueing-dmub-command-status-2-when-waking-from-suspend/53155/21?page=2
* https://gitlab.freedesktop.org/drm/amd/-/issues/2862
