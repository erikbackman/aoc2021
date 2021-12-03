(require 'dash)

(defun buffer-lines (buffer)
  (let ((data))
    (save-excursion
      (goto-char (point-min))
      (with-current-buffer buffer
	(while (not (eobp))
	  (push
	   (buffer-substring-no-properties
	    (line-beginning-position)
	    (line-end-position))
	   data)
	  (forward-line 1))))
    (nreverse data)))

(defun parse (input)
  (-map #'string-to-number input))

(defun compare (pair)
  (if (< (-first-item pair) (-last-item pair)) 1 0))

(defun solve-p1 (data)
  (--> (-partition-in-steps 2 1 data)
       (-map #'compare it)
       (-sum it)))

(solve-p1 (parse (buffer-lines "*aoc-input*")))

(defun solve-p2 (data)
  (--> (-partition-in-steps 3 1 data)
       (-map #'-sum it)
       (solve-p1 it)))

(solve-p2 (parse (buffer-lines "*aoc-input*")))
