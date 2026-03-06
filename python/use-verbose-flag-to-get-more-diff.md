# Use Verbose Flag To Get More Diff

Here is the output of running some `pytest` unit tests. A couple of the tests
pass, which produces little output. But I get a big block of details for the one
failing test. In this case the failure is an assertion between two lists that
don't match.

```bash
❯ uv run pytest
========================================== test session starts ==========================================
platform darwin -- Python 3.12.12, pytest-9.0.2, pluggy-1.6.0
rootdir: /Users/lastword/dev/misc/build-an-llm
configfile: pyproject.toml
collected 3 items

tests/chapter_02/test_bpe_tokenizer.py .F.                                                        [100%]

=============================================== FAILURES ================================================
_____________________________________ test_merge_with_byte_sequence _____________________________________

    def test_merge_with_byte_sequence():
        token_ids = [1, 2, 3, 4, 5, 2, 3, 1, 2, 3, 4, 1]
        merged_tokens = BPETokenizer._merge(token_ids, [2, 3, 4], 256)
        # assert merged_tokens == [1, 256, 5, 2, 3, 1, 256, 1]
>       assert merged_tokens == [1, 256, 5, 4, 5, 1, 256, 1]
E       assert [1, 256, 5, 2, 3, 1, ...] == [1, 256, 5, 4, 5, 1, ...]
E
E         At index 3 diff: 2 != 4
E         Use -v to get more diff

tests/chapter_02/test_bpe_tokenizer.py:13: AssertionError
======================================== short test summary info ========================================
FAILED tests/chapter_02/test_bpe_tokenizer.py::test_merge_with_byte_sequence - assert [1, 256, 5, 2, 3, 1, ...] == [1, 256, 5, 4, 5, 1, ...]
====================================== 1 failed, 2 passed in 0.02s ======================================
```

The lists are too long to fully display in the failure output. `pytest` is able
to tell us two useful things though. First, it mentions that the first
discrepancy in the lists is at index `3` where `2 != 4`. Second, it says `Use -v
to get more diff`.

Let's try rerunning the tests with `-v`.

```bash
❯ uv run pytest -v
========================================== test session starts ==========================================
platform darwin -- Python 3.12.12, pytest-9.0.2, pluggy-1.6.0 -- /Users/lastword/dev/misc/build-an-llm/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/lastword/dev/misc/build-an-llm
configfile: pyproject.toml
collected 3 items

tests/chapter_02/test_bpe_tokenizer.py::test_merge_with_byte_pair PASSED                          [ 33%]
tests/chapter_02/test_bpe_tokenizer.py::test_merge_with_byte_sequence FAILED                      [ 66%]
tests/chapter_02/test_bpe_tokenizer.py::test_subsequence_at_index PASSED                          [100%]

=============================================== FAILURES ================================================
_____________________________________ test_merge_with_byte_sequence _____________________________________

    def test_merge_with_byte_sequence():
        token_ids = [1, 2, 3, 4, 5, 2, 3, 1, 2, 3, 4, 1]
        merged_tokens = BPETokenizer._merge(token_ids, [2, 3, 4], 256)
        # assert merged_tokens == [1, 256, 5, 2, 3, 1, 256, 1]
>       assert merged_tokens == [1, 256, 5, 4, 5, 1, 256, 1]
E       AssertionError: assert [1, 256, 5, 2, 3, 1, ...] == [1, 256, 5, 4, 5, 1, ...]
E
E         At index 3 diff: 2 != 4
E
E         Full diff:
E           [
E               1,
E               256,...
E
E         ...Full output truncated (13 lines hidden), use '-vv' to show

tests/chapter_02/test_bpe_tokenizer.py:13: AssertionError
======================================== short test summary info ========================================
FAILED tests/chapter_02/test_bpe_tokenizer.py::test_merge_with_byte_sequence - AssertionError: assert [1, 256, 5, 2, 3, 1, ...] == [1, 256, 5, 4, 5, 1, ...]
====================================== 1 failed, 2 passed in 0.02s ======================================
```

That was sort of a tease because it starts to display a "Full diff", but that
gets quickly truncated. `pytest` then tells us that we can `use '-vv' to show`
the full diff.

```bash
❯ uv run pytest -vv
========================================== test session starts ==========================================
platform darwin -- Python 3.12.12, pytest-9.0.2, pluggy-1.6.0 -- /Users/lastword/dev/misc/build-an-llm/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/lastword/dev/misc/build-an-llm
configfile: pyproject.toml
collected 3 items

tests/chapter_02/test_bpe_tokenizer.py::test_merge_with_byte_pair PASSED                          [ 33%]
tests/chapter_02/test_bpe_tokenizer.py::test_merge_with_byte_sequence FAILED                      [ 66%]
tests/chapter_02/test_bpe_tokenizer.py::test_subsequence_at_index PASSED                          [100%]

=============================================== FAILURES ================================================
_____________________________________ test_merge_with_byte_sequence _____________________________________

    def test_merge_with_byte_sequence():
        token_ids = [1, 2, 3, 4, 5, 2, 3, 1, 2, 3, 4, 1]
        merged_tokens = BPETokenizer._merge(token_ids, [2, 3, 4], 256)
        # assert merged_tokens == [1, 256, 5, 2, 3, 1, 256, 1]
>       assert merged_tokens == [1, 256, 5, 4, 5, 1, 256, 1]
E       assert [1, 256, 5, 2, 3, 1, 256, 1] == [1, 256, 5, 4, 5, 1, 256, 1]
E
E         At index 3 diff: 2 != 4
E
E         Full diff:
E           [
E               1,
E               256,
E               5,
E         -     4,
E         ?     ^
E         +     2,
E         ?     ^
E         -     5,
E         ?     ^
E         +     3,
E         ?     ^
E               1,
E               256,
E               1,
E           ]

tests/chapter_02/test_bpe_tokenizer.py:13: AssertionError
======================================== short test summary info ========================================
FAILED tests/chapter_02/test_bpe_tokenizer.py::test_merge_with_byte_sequence - assert [1, 256, 5, 2, 3, 1, 256, 1] == [1, 256, 5, 4, 5, 1, 256, 1]

  At index 3 diff: 2 != 4

  Full diff:
    [
        1,
        256,
        5,
  -     4,
  ?     ^
  +     2,
  ?     ^
  -     5,
  ?     ^
  +     3,
  ?     ^
        1,
        256,
        1,
    ]
====================================== 1 failed, 2 passed in 0.02s ======================================
```

This is a lot more output to look at. What we can perhaps see more clearly now
is that the lists match up until there is a mismatch between `2` and `4` at the
third index. And then right after that is another mismatch between `3` and `5`.

This kind of output can only scale so much, so use it when it works and when the
diff view starts to fall short, rework the assertions to get more readable and
actionable test output.
