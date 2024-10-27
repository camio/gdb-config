set disassembly-flavor intel
set debuginfod enabled on
set confirm off
set verbose off
set print thread-events off
set history save on
set tui tab-width 4
## Skip over the implementation's stack frames on abort/etc.
if !$_isvoid($_any_caller_matches)
    define hook-stop
        while $_thread && $_any_caller_matches("^__|abort|raise")
            up-silently
        end
    end
end
