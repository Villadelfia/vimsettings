import os;
import sys;
import ycm_core;

def FlagsForFile(filename, **kwargs):
    sys.path.append(os.path.abspath(os.path.dirname(\
            kwargs['client_data']['g:ycm_global_ycm_extra_conf'])))
    import ycm_global as g

    final_flags = g.BaseFlagsForFile(filename)
    final_flags += g.flags_qt
    final_flags += []

    final_flags = g.MakeRelativePathsInFlagsAbsolute(\
            final_flags, g.ProjectRootDirectory(__file__))

    return {
        'flags': final_flags,
        'do_cache': True
    }
