return {
    s("hh", { t("#include <hedgehog/hedgehog.h>") }),

    -- task
    s("hhtask", fmt([[
    #define {Task}In int
    #define {Task}Out int
    #define {Task}IO 1, {Task}In, {Task}Out

    class {Task} : public hh::AbstractTask<{Task}IO> {{
      public:
        {Task}(size_t numberThreads)
            : hh::AbstractTask<{Task}IO>("{Task}", numberThreads) {{ }}

        void execute() override {{
            {impl}
        }}

        std::shared_ptr<hh::AbstractTask<{Task}IO>>
        copy() override {{
            return std::make_shared<{Task}>(this->numberThreads());
        }}
    }};
    ]], {
        Task = i(1, "Task"),
        impl = i(0),
    }, {
        repeat_duplicates = true,
    })),

    s("hhstate", fmt([[
    #define {State}In int
    #define {State}Out int
    #define {State}IO 1, {State}In, {State}Out

    class {State} : public hh::AbstractState<{State}IO> {{
      public:
        {State}(): hh::AbstractState<{State}IO>() {{ }}

        void execute() override {{
            {impl}
        }}
    }};
    ]], {
        State = i(1, "State"),
        impl = i(0),
    }, {
        repeat_duplicates = true,
    })),

    s("hhstatemanager", fmt([[
    class {State}Manager : public hh::StateManager<{State}IO> {{
      public:
        {State}Manager(std::shared_ptr<{State}> state)
            : hh::StateManager<{State}IO>(state, "State") {{ }}

        \[\[nodiscard\]\] bool canTerminate() const override {{
            this->state()->lock();
            auto result = std::dynamic_pointer_cast<{State}>(this->state()){impl};
            this->state()->unlock();
            return result;
        }}
    }};
    ]], {
        State = i(1, "State"),
        impl = i(0),
    }, {
        repeat_duplicates = true,
    })),
}, {
}
